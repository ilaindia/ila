Imports System.Data.SqlClient

Public Class Sub_Dept_Mapping
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            Load_Department()
            Load_Subject()
        End If
    End Sub
    ''' <summary>
    ''' Load All the Department in Dropdown list
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub Load_Department()
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "select '0' Department_ID, '-Please Select-' Department_Name union all select Pk_DepartmentID, Department_Name from dbo.Department_Entry "
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            ddlDepartmentName.DataSource = dt
            ddlDepartmentName.DataBind()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' Load All The Subject
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub Load_Subject()
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "select PK_SubjectID,Subject_Name from Subject_Entry"
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            CblSubjectList.DataSource = dt
            CblSubjectList.DataBind()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' Subjects Mapped to Department
    ''' </summary>  
    ''' <remarks></remarks>
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            Dim dt As New DataTable
            Dim affrow As String
            cmd.Connection = con
            'Get total count  check subject mapped or not 
            For i = 0 To CblSubjectList.Items.Count - 1
                cmd.CommandText = "select COUNT(*) from subject_Mapping as a  " +
                                      "where a.Fk_DepartmentID= @Fk_DepartmentID And a.FK_SubjectID = @FK_SubjectID"
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Fk_DepartmentID", ddlDepartmentName.SelectedValue)
                cmd.Parameters.AddWithValue("@FK_SubjectID", CblSubjectList.Items(i).Value)
                Dim isNotExist As Boolean = (cmd.ExecuteScalar() = 0)
                'IF Subject is not mapped 
                If CblSubjectList.Items(i).Selected = True Then
                    If isNotExist Then
                        cmd.CommandText = "insert into dbo.subject_Mapping values('" + ddlDepartmentName.SelectedValue + "','" + CblSubjectList.Items(i).Value + "')"
                        cmd.ExecuteNonQuery()
                        Success_Msg("Subject Mapped Successfully")
                    Else
                        Warning_Message("Subject Already Mapped")
                    End If
                Else
                    cmd.CommandText = "select COUNT(*) from Mark_Entry as me join Mark_Entry_Details as med  on me.Slno=FK_Mark_Entry_Slno where me.Fk_DepatmentID=@DepartmentName and med.Fk_SubjectID=@SubjectName"
                    cmd.Parameters.AddWithValue("@DepartmentName", ddlDepartmentName.SelectedValue)
                    cmd.Parameters.AddWithValue("@SubjectName", CblSubjectList.Items(i).Value)
                    affrow = cmd.ExecuteScalar()
                    If affrow = 0 Then
                        If isNotExist = False Then
                            cmd.CommandText = "delete from subject_Mapping   " +
                                              "where Fk_DepartmentID= @Fk_DepartmentID And FK_SubjectID = @FK_SubjectID"
                            cmd.Parameters.Clear()
                            cmd.Parameters.AddWithValue("@Fk_DepartmentID", ddlDepartmentName.SelectedValue)
                            cmd.Parameters.AddWithValue("@FK_SubjectID", CblSubjectList.Items(i).Value)
                            cmd.ExecuteNonQuery()
                            Success_Msg("Subject Unmapped Successfully")
                        End If
                    Else
                        Error_Message("Subject Can't Remove,Which Is Contains Marks")
                        ddlDepartmentName.SelectedValue = 0
                        'Uncheck all check box list
                        For Each item As ListItem In CblSubjectList.Items
                            item.Selected = False
                        Next
                        Exit For
                    End If

                End If
            Next
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' Based on Department Select Subject Load
    ''' </summary>  
    ''' <remarks></remarks>
    Protected Sub ddlDepartmentName_SelectedIndexChanged(sender As Object, e As EventArgs)
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.Connection = con
            cmd.CommandText = "select " +
                              " sub.PK_SubjectID, " +
                              " sub.Subject_Name," +
                              " case when isnull(map.Fk_DepartmentID, '') =  '' then 'false' else 'true' end Is_Mapped " +
                              "from dbo.Subject_Entry sub " +
                              "left join subject_Mapping map on map.FK_SubjectID = sub.PK_SubjectID and map.Fk_DepartmentID = @Fk_DepartmentID"
            cmd.Parameters.AddWithValue("@Fk_DepartmentID", ddlDepartmentName.SelectedValue)
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            CblSubjectList.Items.Clear()
            'for loop for give tick mark for selected value or mapped value
            For Each dr As DataRow In dt.Rows
                Dim li As ListItem = New ListItem()
                li.Value = dr("PK_SubjectID").ToString()
                li.Text = dr("Subject_Name").ToString()
                li.Selected = (dr("Is_Mapped").ToString() = "true")
                CblSubjectList.Items.Add(li)
            Next
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' To establish database connection
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub OpenConnection()
        Try
            If con.State <> ConnectionState.Open Then
                con = New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
                con.Open()
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        End Try
    End Sub
    ''' <summary>
    ''' Close database connection
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub CloseConnection()
        Try
            If con.State = ConnectionState.Open Then
                con.Close()
                con.Dispose()
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        End Try
    End Sub
    ''' <summary>
    ''' Error message Return
    ''' </summary>
    ''' <param name="msg">String</param>
    ''' <remarks></remarks>
    Sub Error_Message(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Error_Msg('" + msg + "');", True)
    End Sub
    ''' <summary>
    ''' Warning Message Return
    ''' </summary>
    ''' <param name="msg">String</param>
    ''' <remarks></remarks>
    Sub Warning_Message(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Warning_Msg('" + msg + "');", True)
    End Sub
    ''' <summary>
    ''' Success Message
    ''' </summary>
    ''' <param name="msg">String</param>
    ''' <remarks></remarks>
    Sub Success_Msg(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Success_Msg('" + msg + "');", True)
    End Sub
End Class