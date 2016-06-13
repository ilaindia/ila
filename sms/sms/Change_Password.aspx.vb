Imports System.Data.SqlClient

Public Class Change_Password
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    'Change Password
    Protected Sub btnChangePwd_Click(sender As Object, e As EventArgs)
        ' DB Connection Establish 
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim Rowcount As Integer
            cmd.Connection = con
            'Store session user name in username
            Dim UserName As String = Session("Username").ToString()
            'Check whether Old Password is correct or not
            cmd.CommandText = "select count(*) from login where UserName=@UserName and Password=@Password COLLATE SQL_Latin1_General_CP1_CS_AS"
            cmd.Parameters.AddWithValue("@UserName", UserName)
            cmd.Parameters.AddWithValue("@Password", txtOldPassword.Text)
            Rowcount = cmd.ExecuteScalar()
            If Rowcount > 0 Then
                'Update New Password
                cmd.CommandText = "update login Set Password=@UpdatePassword where UserName=@UpdateUserName"
                cmd.Parameters.AddWithValue("@UpdateUserName", UserName)
                cmd.Parameters.AddWithValue("@UpdatePassword", txtConfirmPassword.Text)
                cmd.ExecuteNonQuery()
                'Show Password Change Alert 
                Success_Msg("Password Updated Successfully!!")
            Else
                'Show Incorrect Old Password Alert
                Error_Message("Enter Correct Old Password!!")
            End If
        Catch ex As Exception
            Error_Message(ex.Message)
        Finally
            'DB Connection Close
            CloseConnection()
        End Try
        

    End Sub


    ''' <summary>
    ''' Open database connection
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub OpenConnection()
        Try
            If con.State <> ConnectionState.Open Then
                con = New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
                con.Open()
            End If
        Catch ex As Exception

        End Try
    End Sub
    ''' <summary>
    ''' close database connection
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub CloseConnection()
        Try
            If con.State = ConnectionState.Open Then
                con.Close()
                con.Dispose()
            End If
        Catch ex As Exception

        End Try
    End Sub
    ''' <summary>
    ''' Show Error Message
    ''' </summary>
    ''' <param name="msg"></param>
    ''' <remarks></remarks>
    Sub Error_Message(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Error_Msg('" + msg + "');", True)
    End Sub
    ''' <summary>
    ''' Show Success Message
    ''' </summary>
    ''' <param name="msg"></param>
    ''' <remarks></remarks>
    Sub Success_Msg(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Success_Msg('" + msg + "');", True)
    End Sub
End Class