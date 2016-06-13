Imports System.Data.SqlClient
Imports System.Globalization
Public Class Registration
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            Load_Grid()
            Load_Department()
            ClearControl()
        End If
    End Sub
    ''' <summary>
    ''' To load previous records and insert into Grid
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub Load_Grid()
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "select PK_StudentID, Name,convert(varchar(10), DOB, 103) DOB, PhoneNo, FatherName, MotherName, convert(varchar(10), DOJ, 105)  DOJ,FK_DepartmentID from dbo.Student_Registration"
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
    ''' Clear the all Controls fields
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub ClearControl()
        hfValue.Value = ""
        txtID.Text = "(Auto)"
        txtName.Text = ""
        txtDob.Text = ""
        txtDoj.Text = ""
        rdMale.Checked = False
        rdFemale.Checked = False
        ddlCaste.SelectedValue = "0"
        ddlDepartment.SelectedValue = "0"
        txtAddress.Text = ""
        txtMobile.Text = ""
        TxtFatherName.Text = ""
        TxtMotherName.Text = ""
        ddlBloodGroup.SelectedValue = "0"
        ddlBoarding.SelectedValue = "0"
        pnEntry.Visible = False
        pnList.Visible = True
    End Sub
    ''' <summary>
    ''' List All Department Name in DropDown list 
    ''' </summary>
    ''' <remarks></remarks>

    Public Sub Load_Department()
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "select '0' Pk_DepartmentID, '-Please Select-' DepartmentName union all select Pk_DepartmentID, Department_Name from dbo.Department_Entry"
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            ddlDepartment.DataSource = dt
            ddlDepartment.DataBind()
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    'click AddNew Button
    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs)
        'Visible  Save button and Panel Entry 
        btnSave.Visible = True
        pnEntry.Visible = True
        'Disable Panel list and Update Button
        pnList.Visible = False
        btnUpdate.Visible = False
        Dim regDate As Date = Date.Now()
        Dim strDate As String = regDate.ToString("dd/MM/yyy")
        txtDoj.Text = strDate
        txtDoj.Enabled = False
    End Sub
    Protected Sub btnClear_Click(sender As Object, e As EventArgs)
        ClearControl()
        'Disable Panel Entry
        pnEntry.Visible = False
        'Disable Panel List
        pnList.Visible = True
    End Sub
    'Store all the record in Database
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        'Both Radio Button is False Show Warning Message 
        If rdFemale.Checked = False And rdMale.Checked = False Then
            Warning_Message("Please Select Gender")
            Exit Sub
        End If
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            cmd.Connection = con
            cmd.CommandText = "select  count(*) from  Student_Registration  where  PhoneNo=@PhoneNo"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@PhoneNo", txtMobile.Text)
            'Phone no Already  Avaliable in DB Return Warning Message
            If cmd.ExecuteScalar() > 0 Then
                msg += "Mobile Number already exits"
            End If
            'Get Age Limit for Admission form DB
            cmd.CommandText = "select Age_Limit from Department_Entry where Pk_DepartmentID =@Pk_DepartmentID "
            cmd.Parameters.AddWithValue("@Pk_DepartmentID", ddlDepartment.SelectedValue)
            Dim Age_Limit As Integer = Convert.ToInt16(cmd.ExecuteScalar())
            Dim dob As DateTime = DateTime.ParseExact(txtDob.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture)
            Dim doj As DateTime = DateTime.ParseExact(txtDoj.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture)
            'Get Current Year and Dob Year And Subtract Then Store
            Dim Age As Integer = DateTime.Now.Year - dob.Year
            'If Age Limit Existed Return Warning Message
            If Not (Age >= Age_Limit And Age <= Age_Limit + 1) Then
                msg += Environment.NewLine + "Student Age Must Be " + Age_Limit.ToString() + " To " + (Age_Limit + 1).ToString()
            End If
            'String Empty Return Warning Message
            If msg <> String.Empty Then
                Warning_Message(msg)
                Exit Sub
            End If
            'Insert The Record Into Student Registration Table 
            cmd.CommandText = "insert into " +
                                 "      dbo.Student_Registration(Pk_Studentid,Name,DOB,Gender,Caste,FK_DepartmentID,PhoneNo,DOJ,BloodGroup,Address,FatherName,MotherName,Boarding) " +
                                 " values (dbo.GET_STUDENT_ID(),@Name,@DOB,@Gender,@Caste,@FK_DepartmentID,@PhoneNo,@DOJ,@BloodGroup,@Address,@FatherName,@MotherName,@Boarding)"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Name", txtName.Text)
            Dim SqlDob As String = dob.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture)
            cmd.Parameters.AddWithValue("@DOB", SqlDob)
            cmd.Parameters.AddWithValue("@Gender", If(rdMale.Checked, "M", "F"))
            cmd.Parameters.AddWithValue("@Caste", ddlCaste.SelectedValue)
            cmd.Parameters.AddWithValue("@FK_DepartmentID", ddlDepartment.SelectedValue)
            cmd.Parameters.AddWithValue("@PhoneNo", txtMobile.Text)
            Dim SqlDoj As String = doj.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
            cmd.Parameters.AddWithValue("@DOJ", SqlDoj)
            cmd.Parameters.AddWithValue("@BloodGroup", ddlBloodGroup.SelectedValue)
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
            cmd.Parameters.AddWithValue("@FatherName", TxtFatherName.Text)
            cmd.Parameters.AddWithValue("@MotherName", TxtMotherName.Text)
            cmd.Parameters.AddWithValue("@Boarding", ddlBoarding.SelectedValue)
            Dim Affrows As String = cmd.ExecuteNonQuery()
            'Affrow Greater Then 0 Display Message
            If Affrows > 0 Then
                Success_Message("Record Inserted Success")
                Load_Grid()
                ClearControl()
            Else
                Warning_Message("Record Not Inserted.. Something Went Wrong...!")
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    'Click Update button Stored updated Records into Database
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            cmd.Connection = con
            cmd.CommandText = "select  count(*) from  Student_Registration  where  PhoneNo=@PhoneNo And PK_Studentid <> @Student_id"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@PhoneNo", txtMobile.Text)
            cmd.Parameters.AddWithValue("@Student_id", hfValue.Value)
            'Phone no Already  Avaliable in DB Return Warning Message
            If cmd.ExecuteScalar() > 0 Then
                msg += "Mobile number already exits"
            End If
            If msg <> String.Empty Then
                Throw New ApplicationException(msg)
            End If
            Dim dob As DateTime = DateTime.ParseExact(txtDob.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture)
            Dim SqlDob As String = dob.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture)
            Dim doj As DateTime = DateTime.ParseExact(txtDoj.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture)
            Dim SqlDoj As String = doj.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture)
            'Fetch Age_limit form DB
            cmd.CommandText = "select Age_Limit from Department_Entry where Pk_DepartmentID =@Pk_DepartmentID "
            cmd.Parameters.AddWithValue("@Pk_DepartmentID", ddlDepartment.SelectedValue)
            Dim Age_Limit As Integer = Convert.ToInt16(cmd.ExecuteScalar())
            'Get Current Year and Dob Year And Subtract Then Store
            Dim Age As Integer = DateTime.Now.Year - dob.Year
            'If Age Limit Existed Return Warning Message
            If Not (Age >= Age_Limit And Age <= Age_Limit + 1) Then
                msg += Environment.NewLine + "Student Age Must Be " + Age_Limit.ToString() + " To " + (Age_Limit + 1).ToString()
            End If
            'String Empty Return Warning Message
            If msg <> String.Empty Then
                Warning_Message(msg)
                Exit Sub
            End If
            'Update The Record
            cmd.CommandText = "Update dbo.Student_Registration" +
                                 "      Set Name = @Name, " +
                                 "      DOB = @DOB, " +
                                 "      Gender = @Gender, " +
                                 "      Caste = @Caste, " +
                                 "      FK_DepartmentID = @FK_DepartmentID , " +
                                 "      PhoneNo = @PhoneNo, " +
                                 "      DOJ = @DOJ, " +
                                 "      BloodGroup = @BloodGroup, " +
                                 "      Address = @Address, " +
                                 "      FatherName = @FatherName, " +
                                 "      MotherName = @MotherName, " +
                                 "      Boarding = @Boarding " +
                                 " where PK_Studentid=@Student_id "
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Student_id", hfValue.Value)
            cmd.Parameters.AddWithValue("@Name", txtName.Text)
            cmd.Parameters.AddWithValue("@DOB", SqlDob)
            cmd.Parameters.AddWithValue("@Gender", If(rdMale.Checked, "M", "F"))
            cmd.Parameters.AddWithValue("@Caste", ddlCaste.SelectedValue)
            cmd.Parameters.AddWithValue("@FK_DepartmentID", ddlDepartment.SelectedValue)
            cmd.Parameters.AddWithValue("@PhoneNo", txtMobile.Text)
            cmd.Parameters.AddWithValue("@DOJ", SqlDoj)
            cmd.Parameters.AddWithValue("@BloodGroup", ddlBloodGroup.SelectedValue)
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
            cmd.Parameters.AddWithValue("@FatherName", TxtFatherName.Text)
            cmd.Parameters.AddWithValue("@MotherName", TxtMotherName.Text)
            cmd.Parameters.AddWithValue("@Boarding", ddlBoarding.SelectedValue)
            Dim Affrows As Integer = cmd.ExecuteNonQuery()
            'Affrow Greater Then 0 Display Message
            If Affrows > 0 Then
                Success_Message("Record Updated Successfully...!")
                Load_Grid()
            Else
                Warning_Message("Record Not Updated.. Something Went Wrong...!")
            End If
            ClearControl()
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
    ''' Disconnect  the DB Connection
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
    'Edit and Deleted action Perform
    Protected Sub btnEdit_Delete_Command(sender As Object, e As CommandEventArgs)
        ClearControl()
        Dim i As Integer = Convert.ToInt32(e.CommandArgument)
        hfValue.Value = CType(gvListview.Rows(i).FindControl("hfStudentID"), HiddenField).Value
        If e.CommandName = "EditData" Then
            OpenConnection()
            Try
                Dim cmd As New SqlCommand()
                cmd.Connection = con
                Dim dt As New DataTable
                Dim da As SqlDataAdapter
                cmd.CommandText = "select " +
                                  "     Pk_StudentId, Name, convert(varchar(10), DOB, 103) DOB, Gender, Caste, FK_DepartmentID, PhoneNo, " +
                                  "     convert(varchar(10), DOJ, 103) DOJ,cast(BloodGroup as varchar) as BloodGroup, Address, FatherName, MotherName, Boarding " +
                                  " from dbo.Student_Registration where pk_Studentid = @Student_id"
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Student_id", hfValue.Value)
                da = New SqlDataAdapter(cmd)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    Dim dr As DataRow = dt.Rows(0)
                    txtID.Text = dr("PK_Studentid").ToString()
                    txtName.Text = dr("Name").ToString()
                    txtDob.Text = dr("DOB").ToString()
                    rdFemale.Checked = (dr("Gender").ToString() = "F")
                    rdMale.Checked = (dr("Gender").ToString() = "M")
                    ddlCaste.SelectedValue = dr("Caste").ToString()
                    ddlDepartment.SelectedValue = dr("FK_DepartmentID").ToString()
                    txtMobile.Text = dr("PhoneNo").ToString()
                    txtDoj.Text = dr("DOJ").ToString()
                    ddlBloodGroup.SelectedValue = dr("BloodGroup").ToString()
                    txtAddress.Text = dr("Address").ToString()
                    TxtFatherName.Text = dr("FatherName").ToString()
                    TxtMotherName.Text = dr("MotherName").ToString()
                    ddlBoarding.SelectedValue = dr("Boarding").ToString()
                    pnEntry.Visible = True
                    pnList.Visible = False
                    btnSave.Visible = False
                    btnUpdate.Visible = True
                    txtDoj.Enabled = False
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
                cmd.CommandText = "delete dbo.Student_Registration where Pk_StudentId=@Student_id "
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Student_id", hfValue.Value)
                Dim Affrows As Integer = cmd.ExecuteNonQuery()
                If Affrows > 0 Then
                    Warning_Message("Record Deleted Successfully")
                    Load_Grid()
                Else
                    Warning_Message("Record Not Deleted.. Something Went Wrong...!")
                End If
            Catch ex As Exception
                Error_Message(ex.Message)
            Finally
                CloseConnection()
            End Try
        End If
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
    Sub Success_Message(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Success_Msg('" + msg + "');", True)
    End Sub
End Class