Imports System.Data.SqlClient
Public Class Mark_Entry
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            Load_Dept_Exam()
            'Current Year Display while Load Page
            txtExamYear.Text = System.DateTime.Today.Year
        End If
    End Sub
    ''' <summary>
    ''' Load all Department name And Exam Name
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub Load_Dept_Exam()
        OpenConnection()
        'Cancel Button and Save Button is Disable
        btnCancel.Visible = False
        btnSave.Visible = False
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            'Fetch Department Name 
            cmd.CommandText = "SELECT '0' Pk_DepartmentID, '-Please Select-' Department_Name " + Environment.NewLine +
                              "UNION ALL " + "SELECT " +
                              " Pk_DepartmentID, Department_Name " +
                              "FROM dbo.Department_Entry "
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            ddlDepartment.DataSource = dt
            ddlDepartment.DataBind()
            cmd = New SqlCommand()
            cmd.Connection = con
            dt = New DataTable()
            da = New SqlDataAdapter()
            'Fetch Exam Name
            cmd.CommandText = "SELECT '0' Slno, '-Please Select-' Exam_Name " +
                              "UNION ALL " + "SELECT " +
                              " Slno, Exam_Name " +
                              "FROM dbo.Exam_Entry "
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            ddlExamName.DataSource = dt
            ddlExamName.DataBind()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' List all the Student name and therie Subjects
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub btnShow_Click(sender As Object, e As EventArgs)
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dtStu_Mark As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "usp_Mark_Entry"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Dept_ID", ddlDepartment.SelectedValue)
            cmd.Parameters.AddWithValue("@Exam_Slno", ddlExamName.SelectedValue)
            cmd.Parameters.AddWithValue("@Exm_Year", txtExamYear.Text)
            da = New SqlDataAdapter(cmd)
            da.Fill(dtStu_Mark)
            If dtStu_Mark.Rows.Count = 0 Then
                Warning_Message("No Record Found!")
                Exit Sub
            End If
            Dim dtMark_Entry_Grid As New DataTable()
            dtMark_Entry_Grid.Columns.Add("Student_Name")
            dtMark_Entry_Grid.Columns.Add("Student_ID")
            'Store the data in Data Table
            Dim dtSubject As DataTable = dtStu_Mark.AsEnumerable().GroupBy(Function(r) r.Field(Of String)("Subject_ID")).Select(Function(g) g.First()).CopyToDataTable()
            'Add Column name  In Grid
            For i As Integer = 0 To dtSubject.Rows.Count - 1
                dtMark_Entry_Grid.Columns.Add("SubName_" + dtSubject.Rows(i)("Subject_Name").ToString())
                dtMark_Entry_Grid.Columns.Add("SubID_" + dtSubject.Rows(i)("Subject_Name").ToString())
                dtMark_Entry_Grid.Columns.Add("SubMark_" + dtSubject.Rows(i)("Subject_Name").ToString())
                dtMark_Entry_Grid.Columns.Add("MarkDetailSlno_" + dtSubject.Rows(i)("Subject_Name").ToString())
            Next
            Dim dtData As DataTable = dtStu_Mark.AsEnumerable().GroupBy(Function(r) r.Field(Of String)("Student_Name")).Select(Function(g) g.First()).CopyToDataTable()
            For i As Integer = 0 To dtData.Rows.Count - 1
                Dim drMark_Entry_Grid As DataRow = dtMark_Entry_Grid.NewRow()
                Dim drList As DataRow() = dtStu_Mark.Select("Student_ID='" + dtData.Rows(i)("Student_ID").ToString() + "'")
                'Fetch the data from Datatable and Assign value to Correspond Felids
                For Each dr As DataRow In drList
                    drMark_Entry_Grid("Student_ID") = dr("Student_ID")
                    drMark_Entry_Grid("Student_Name") = dr("Student_Name")
                    drMark_Entry_Grid("SubName_" + dr("Subject_Name").ToString()) = dr("Subject_Name")
                    drMark_Entry_Grid("SubID_" + dr("Subject_Name").ToString()) = dr("Subject_ID")
                    drMark_Entry_Grid("SubMark_" + dr("Subject_Name").ToString()) = dr("Mark")
                    drMark_Entry_Grid("MarkDetailSlno_" + dr("Subject_Name").ToString()) = dr("Mark_Detail_Slno")
                Next
                dtMark_Entry_Grid.Rows.Add(drMark_Entry_Grid)
            Next
            gvStudentMark.Columns.Clear()
            For Each dc As DataColumn In dtMark_Entry_Grid.Columns
                Dim tfObject As New TemplateField()
                'Split the  value 
                Dim col As String() = dc.ColumnName.Split("_"c)
                If col(0) <> "SubName" AndAlso dc.ColumnName <> "Student_Name" Then
                    Continue For
                End If
                tfObject.HeaderText = If(dc.ColumnName = "Student_Name", dc.ColumnName, col(1))
                'Create New Template for colum name
                tfObject.ItemTemplate = New CreateItemTemplate(ListItemType.Item, col(1), dc.ColumnName)

                gvStudentMark.Columns.Add(tfObject)
                If dc.ColumnName <> "Student_Name" Then
                    gvStudentMark.Columns(gvStudentMark.Columns.Count - 1).HeaderStyle.Width = 200
                Else
                    gvStudentMark.Columns(gvStudentMark.Columns.Count - 1).HeaderStyle.Width = 100
                End If
            Next
            gvStudentMark.DataSource = dtMark_Entry_Grid
            gvStudentMark.DataBind()
            btnShow.Visible = False
            btnCancel.Visible = True
            btnSave.Visible = True
            gvStudentMark.Visible = True
            ddlDepartment.Enabled = False
            ddlExamName.Enabled = False
            txtExamYear.Enabled = False
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    ''' Get Student mark
    ''' </summary>    
    ''' <remarks></remarks>
    Protected Sub gvStudentMark_RowCreated(sender As Object, e As GridViewRowEventArgs)
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                For i As Integer = 0 To e.Row.Cells.Count - 1
                    ' HeaderText as column Name 
                    Dim _colname As String = gvStudentMark.Columns(i).HeaderText
                    'Student name or Subject Id Show in Lable 
                    If _colname = "Student_Name" Or _colname = "Subject_ID" Then
                        Dim lbl As New Label()
                        lbl.ID = Convert.ToString("lbl") & _colname
                        e.Row.Cells(i).Controls.Add(lbl)
                        Dim hfStudent_ID As New HiddenField()
                        hfStudent_ID.ID = "hfStudent_ID"
                        e.Row.Cells(i).Controls.Add(hfStudent_ID)
                    Else
                        'Other Wise Value store in Text Box
                        Dim txtSubMark As New TextBox()
                        txtSubMark.ID = Convert.ToString("txtSubMark_") & _colname
                        txtSubMark.CssClass = "form-control decimal2"
                        txtSubMark.MaxLength = 5
                        e.Row.Cells(i).Controls.Add(txtSubMark)
                        Dim hfSubID As New HiddenField()
                        hfSubID.ID = Convert.ToString("hfSubID_") & _colname
                        e.Row.Cells(i).Controls.Add(hfSubID)
                        Dim hfMarkDetailSlno As New HiddenField()
                        hfMarkDetailSlno.ID = Convert.ToString("hfMarkDetailSlno_") & _colname
                        e.Row.Cells(i).Controls.Add(hfMarkDetailSlno)
                    End If
                Next
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        End Try
    End Sub
    ''' <summary>
    ''' show the mark details in grid
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub gvStudentMark_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim drv As DataRowView = DirectCast(e.Row.DataItem, DataRowView)
                'Subject Name Store in Label
                Dim lblStudent_Name As Label = DirectCast(e.Row.FindControl("lblStudent_Name"), Label)
                lblStudent_Name.Text = drv("Student_Name").ToString()
                'Student Id Store in Hidden field
                Dim hfStudent_ID As HiddenField = DirectCast(e.Row.FindControl("hfStudent_ID"), HiddenField)
                hfStudent_ID.Value = drv("Student_ID").ToString()

                Dim dtCols As DataTable = drv.DataView.ToTable().Clone()
                For i As Integer = 0 To gvStudentMark.Columns.Count - 1
                    Dim _colname As String = gvStudentMark.Columns(i).HeaderText
                    If _colname = "Student_Name" Or _colname = "Subject_ID" Then
                        Continue For
                    End If
                    Dim ColSuffix As String = _colname.Split("_"c)(_colname.Split("_"c).Length - 1)
                    Dim txtSubMark As TextBox = DirectCast(e.Row.FindControl(Convert.ToString("txtSubMark_") & _colname), TextBox)
                    'Store the Subject mark in label
                    txtSubMark.Text = drv(Convert.ToString("SubMark_") & ColSuffix).ToString()
                    'Store Subject Id in Hidden Field
                    Dim hfSubID As HiddenField = DirectCast(e.Row.FindControl(Convert.ToString("hfSubID_") & _colname), HiddenField)
                    hfSubID.Value = drv(Convert.ToString("SubID_") & ColSuffix).ToString()
                    'Store The Mark Detail Slno In Hidden Field
                    Dim hfMarkDetailSlno As HiddenField = DirectCast(e.Row.FindControl(Convert.ToString("hfMarkDetailSlno_") & _colname), HiddenField)
                    hfMarkDetailSlno.Value = drv(Convert.ToString("MarkDetailSlno_") & ColSuffix).ToString()
                Next
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        End Try
    End Sub
    ''' <summary>
    ''' To save all details
    ''' </summary>   
    ''' <remarks></remarks>
    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        OpenConnection()
        Try
            Dim Affrow As Integer
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            'Select Department ,Exam name and Year
            cmd.CommandText = "SELECT " +
                              " ISNULl(Slno, 0) " +
                              "FROM dbo.Mark_Entry " + "WHERE Fk_DepatmentID=@Fk_DepatmentID and " +
                              " Fk_Exam_Slno = @Fk_Exam_Slno AND  " +
                              " Exm_Year = @Exm_Year"
            cmd.Parameters.AddWithValue("@Fk_DepatmentID", ddlDepartment.SelectedValue)
            cmd.Parameters.AddWithValue("@Fk_Exam_Slno", ddlExamName.SelectedValue)
            cmd.Parameters.AddWithValue("@Exm_Year", txtExamYear.Text)
            Dim Mark_Slno As Integer = cmd.ExecuteScalar()
            'If Record not In The list Then Insert That  Information
            If Mark_Slno = 0 Then
                cmd.CommandText = "INSERT INTO Mark_Entry  " +
                                  " (Fk_DepatmentID, Fk_Exam_Slno, Exm_Year)  " +
                                  "VALUES (@Fk_DepatmentID, @Fk_Exam_Slno, @Exm_Year)"
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Fk_DepatmentID", ddlDepartment.SelectedValue)
                cmd.Parameters.AddWithValue("@Fk_Exam_Slno", ddlExamName.SelectedValue)
                cmd.Parameters.AddWithValue("@Exm_Year", txtExamYear.Text)

                If cmd.ExecuteNonQuery() > 0 Then
                    'Return Last slno of the Table
                    cmd.CommandText = "SELECT IDENT_CURRENT('Mark_Entry')"
                    cmd.Parameters.Clear()
                    Mark_Slno = cmd.ExecuteScalar()
                Else
                    Throw New Exception("Some Thing Went Wrong")
                End If
            End If
            For Each gvr As GridViewRow In gvStudentMark.Rows
                For j As Integer = 1 To gvStudentMark.Columns.Count - 1
                    Dim field As DataControlField = gvStudentMark.Columns(j)
                    If field.[GetType]().Name <> "TemplateField" Then
                        Continue For
                    End If
                    Dim CtrlSuffix As String = gvStudentMark.Columns(j).HeaderText

                    Dim Mark_Detail_Slno As String = DirectCast(gvr.FindControl("hfMarkDetailSlno_" + CtrlSuffix), HiddenField).Value
                    Dim Student_Id As String = DirectCast(gvr.FindControl("hfStudent_ID"), HiddenField).Value
                    Dim Subject_Id As String = DirectCast(gvr.FindControl("hfSubID_" + CtrlSuffix), HiddenField).Value
                    Dim Subject_Mark As String = DirectCast(gvr.FindControl("txtSubMark_" + CtrlSuffix), TextBox).Text
                    'Mark_detail_slno empty insert the value
                    'Mark_detail_slno have value then update the Record
                    If Mark_Detail_Slno = "" Then
                        cmd.CommandText = "INSERT INTO Mark_Entry_Details " + Environment.NewLine +
                                          "     (FK_StudentID, Fk_SubjectID, Mark, FK_Mark_Entry_Slno)  " + Environment.NewLine +
                                          " VALUES(@Student_Id, @Subject_Id, @Subject_Mark, @FK_Mark_Entry_Slno)"
                        cmd.Parameters.Clear()
                    Else
                        cmd.CommandText = "UPDATE Mark_Entry_Details " +
                                          "SET FK_StudentID = @Student_Id, " +
                                          "     Fk_SubjectID = @Subject_Id, " +
                                          "     Mark = @Subject_Mark, " +
                                          "     FK_Mark_Entry_Slno = @FK_Mark_Entry_Slno " +
                                          " WHERE Slno = @Slno"
                        cmd.Parameters.Clear()
                        cmd.Parameters.AddWithValue("@Slno", Mark_Detail_Slno)
                    End If
                    cmd.Parameters.AddWithValue("@Student_Id", Student_Id)
                    cmd.Parameters.AddWithValue("@Subject_Id", Subject_Id)
                    cmd.Parameters.AddWithValue("@Subject_Mark", Subject_Mark)
                    cmd.Parameters.AddWithValue("@FK_Mark_Entry_Slno", Mark_Slno)
                    Affrow = cmd.ExecuteNonQuery()
                Next
            Next
            If Affrow > 0 Then
                Success_Msg("Record Saved Successfully")
                btnShow.Visible = True
                btnCancel.Visible = False
                btnSave.Visible = False
                gvStudentMark.Visible = False
                ddlDepartment.Enabled = True
                ddlExamName.Enabled = True
                txtExamYear.Enabled = True
                ddlDepartment.Text = 0
                ddlExamName.Text = 0
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
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
    ''' <summary>
    ''' Clear all controls
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        txtExamYear.Text = System.DateTime.Today.Year
        ddlDepartment.SelectedValue = "0"
        ddlExamName.SelectedValue = "0"
        btnCancel.Visible = False
        btnSave.Visible = False
        btnShow.Visible = True
        gvStudentMark.Visible = False
        ddlDepartment.Enabled = True
        ddlExamName.Enabled = True
        txtExamYear.Enabled = True
    End Sub
End Class