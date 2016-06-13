Imports System.Data.SqlClient
Imports System.Globalization

Public Class Department
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            'Load grid 
            Load_Grid()
            ClearControl()
        End If
    End Sub
    ''' <summary>
    ''' To load previous records and insert into Grid
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
            cmd.CommandText = "select PK_DepartmentID,Department_Name,Age_Limit from dbo.Department_Entry"
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
        txtDeptID.Text = "(Auto)"
        txtDeptName.Text = ""
        ddlAgeLimit.SelectedValue = "0"
    End Sub
    ''' <summary>
    '''Store all the record in Database
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        btnCancel.Visible = True
        btnUpdate.Visible = False
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "select  count(*) from  Department_Entry  where  Department_Name=@Department_Name"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Department_Name", txtDeptName.Text)
            If cmd.ExecuteScalar() > 0 Then
                Warning_Message("Department <b>" + txtDeptName.Text + "</b> Already Exist..!")
                Exit Sub
            End If
            cmd.CommandText = "insert into " +
                               "      dbo.Department_Entry(PK_DepartmentID,Department_Name,Age_Limit) " +
                               " values (dbo.GET_Department_ID(),@Department_Name,@Age_Limit)"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Department_Name", txtDeptName.Text)
            cmd.Parameters.AddWithValue("@Age_Limit", ddlAgeLimit.Text)
            Dim Affrows As Integer = cmd.ExecuteNonQuery()
            If Affrows > 0 Then
                Success_Msg("Record Inserted Success")
                Load_Grid()
                ClearControl()
            Else
                Warning_Message("Something Wrong")
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    ''' <summary>
    '''Clear all the fields and Enable Save ,Cancel button and False update Button
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        ClearControl()
        btnCancel.Visible = True
        btnUpdate.Visible = False
        btnSave.Visible = True
    End Sub
    ''' <summary>
    '''Edit and Deleted action Perform
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub btnEdit_Delete_Command(sender As Object, e As CommandEventArgs)
        ClearControl()
        Dim i As Integer = Convert.ToInt32(e.CommandArgument)
        hfValue.Value = CType(gvListview.Rows(i).FindControl("hfDept_ID"), HiddenField).Value
        If e.CommandName = "EditData" Then
            OpenConnection()
            Try
                Dim cmd As New SqlCommand()
                cmd.Connection = con
                Dim dt As New DataTable
                Dim da As SqlDataAdapter
                cmd.CommandText = "select " +
                                  "     Pk_DepartmentID, Department_Name, Age_Limit" +
                                  " from dbo.Department_Entry where PK_DepartmentID = @PK_DepartmentID"
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@PK_DepartmentID", hfValue.Value)
                da = New SqlDataAdapter(cmd)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    Dim dr As DataRow = dt.Rows(0)
                    txtDeptID.Text = dr("PK_DepartmentID").ToString()
                    txtDeptName.Text = dr("Department_Name").ToString()
                    ddlAgeLimit.Text = dr("Age_Limit").ToString()
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
                cmd.CommandText = "delete dbo.Department_Entry where PK_DepartmentID=@PK_DepartmentID "
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@PK_DepartmentID", hfValue.Value)
                Dim Affrows As Integer = cmd.ExecuteNonQuery()
                If Affrows > 0 Then
                    Success_Msg("Record Deleted Successfully")
                    Load_Grid()
                Else
                    Error_Message("Something Wrong")
                End If
            Catch ex As SqlException
                'Custom error throw 547 is Foreign key reference error
                If ex.Number = 547 Then
                    Error_Message("Department Mapped to Subject  ,So Unable to Delete this Department")
                Else
                    Error_Message(ex.Message)
                End If

            Finally
                CloseConnection()
            End Try
        End If
    End Sub
    ''' <summary>
    '''Click Update button Stored updated Records into Database
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        btnSave.Visible = True
        btnCancel.Visible = True
        btnUpdate.Visible = False
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty
            cmd.Connection = con

            cmd.CommandText = "select  count(*) from  Department_Entry  where  Department_Name=@Department_Name and Age_Limit=@AgeLimit "
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@Department_Name", txtDeptName.Text)
            cmd.Parameters.AddWithValue("@AgeLimit", ddlAgeLimit.SelectedValue)
            If cmd.ExecuteScalar() > 0 Then
                Warning_Message("Department <b>" + txtDeptName.Text + "</b> Already Exist..!")
                Exit Sub
            End If
            cmd.CommandText = "Update  dbo.Department_Entry set Department_Name=@Department_Name, Age_limit=@Age_Limit where PK_DepartmentID=@PK_DepartmentID"
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@PK_DepartmentID", hfValue.Value)
            cmd.Parameters.AddWithValue("@Department_Name", txtDeptName.Text)
            cmd.Parameters.AddWithValue("@Age_Limit", ddlAgeLimit.Text)
            Dim Affrows As Integer = cmd.ExecuteNonQuery()
            If Affrows > 0 Then
                Success_Msg("Record updated Successfully")
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