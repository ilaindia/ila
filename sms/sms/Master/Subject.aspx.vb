Imports System.Data.SqlClient

Public Class Subject
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    'Page load event occur
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Load Previous Subjects
        'Clear All Controls
        If Page.IsPostBack <> True Then
            Load_Grid()
            ClearControl()
        End If

    End Sub
    ''' <summary>
    ''' Load All Subject Details From Db
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub Load_Grid()
        btnCancel.Visible = True
        btnUpdate.Visible = False
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "select PK_Subjectid,Subject_Name from dbo.Subject_Entry"
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            gvListview.DataSource = dt
            gvListview.DataBind()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' clear all the controls 
    ''' </summary>
    ''' <remarks>text box id shows text as auto</remarks>
    Public Sub ClearControl()
        hfValue.Value = ""
        txtID.Text = "(Auto)"
        txtSubjectName.Text = ""
    End Sub
    'Click Save Button To Store All The Value Into DB 
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        btnCancel.Visible = True
        btnUpdate.Visible = False
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            cmd.Connection = con
            cmd.CommandText = "select  count(*) from  Subject_Entry  where  Subject_Name=@Subject_Name"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Subject_Name", txtSubjectName.Text)
            If cmd.ExecuteScalar() > 0 Then
                msg += "Subject Name already exits"
            End If
            If msg <> String.Empty Then
                Throw New ApplicationException(msg)
            End If
            cmd.CommandText = "insert into " +
                               "      dbo.Subject_Entry(PK_Subjectid,Subject_Name) " +
                               " values (dbo.GET_Subject_ID(),@Subject_Name)"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Subject_Name", txtSubjectName.Text)
            Dim Affrows As Integer = cmd.ExecuteNonQuery()
            If Affrows > 0 Then
                Success_Msg("Record Inserted Success")
                Load_Grid()
            Else
                Error_Message("Something Wrong")
            End If
            ClearControl()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try

    End Sub
    'When click Clear Button All The Control Rest to Empty
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        ClearControl()
        btnCancel.Visible = True
        btnUpdate.Visible = False
        btnSave.Visible = True
    End Sub
    'Edit and Delete Operation Perform
    Protected Sub btnEdit_Delete_Command(sender As Object, e As CommandEventArgs)
        ClearControl()
        Dim i As Integer = Convert.ToInt32(e.CommandArgument)
        'subject_id stored in hidden field
        hfValue.Value = CType(gvListview.Rows(i).FindControl("hfSubject_ID"), HiddenField).Value
        'when click edit button move to if part Or click delete button
        If e.CommandName = "EditData" Then
            OpenConnection()
            Try
                Dim cmd As New SqlCommand()
                cmd.Connection = con
                Dim dt As New DataTable
                Dim da As SqlDataAdapter
                cmd.CommandText = "select " +
                                  "     PK_Subjectid, Subject_Name " +
                                  " from dbo.Subject_Entry where PK_Subjectid = @Subject_ID"
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Subject_ID", hfValue.Value)
                da = New SqlDataAdapter(cmd)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    Dim dr As DataRow = dt.Rows(0)
                    txtID.Text = dr("PK_Subjectid").ToString()
                    txtSubjectName.Text = dr("Subject_Name").ToString()
                    btnUpdate.Visible = True
                    btnCancel.Visible = True
                    btnSave.Visible = False
                End If
            Catch ex As Exception
                Error_Message(ex.Message)
            Finally
                CloseConnection()
            End Try
        ElseIf e.CommandName = "DeleteData" Then
            OpenConnection()
            Try
                Dim cmd As New SqlCommand()
                cmd.Connection = con
                cmd.CommandText = "delete dbo.Subject_Entry where PK_Subjectid=@Subject_ID "
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Subject_ID", hfValue.Value)
                Dim Affrows As Integer = cmd.ExecuteNonQuery()
                If Affrows > 0 Then
                    Success_Msg("Record Deleted Successfully")
                    Load_Grid()
                Else
                    Error_Message("Something Wrong")
                End If
            Catch ex As SqlException
                If ex.Number = 547 Then
                    Warning_Message("Subject linked to Department ,So Unable Remove This Subject")
                Else
                    Error_Message(ex.Message)
                End If

            Finally
                CloseConnection()
            End Try
        End If
    End Sub
    'To Update The Subject Name 
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        btnSave.Visible = True
        btnCancel.Visible = True
        btnUpdate.Visible = False
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            cmd.Connection = con
            cmd.Connection = con
            cmd.CommandText = "select  count(*) from  Subject_Entry  where  Subject_Name=@Subject_Name"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Subject_Name", txtSubjectName.Text)
            If cmd.ExecuteScalar() > 0 Then
                msg = "Subject Name already exits"
            End If
            If msg <> String.Empty Then
                Throw New ApplicationException(msg)
            End If
            cmd.CommandText = "Update  dbo.Subject_Entry set Subject_name=@Subject_Name where PK_SubjectID=@Subject_ID"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Subject_ID", hfValue.Value)
            cmd.Parameters.AddWithValue("@Subject_Name", txtSubjectName.Text)
            Dim Affrows As Integer = cmd.ExecuteNonQuery()
            If Affrows > 0 Then
                Success_Msg("Record Updated Successfully")
                Load_Grid()
            Else
                Error_Message("Something Wrong")
            End If
            ClearControl()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' To Establish Database Connection
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