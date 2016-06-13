Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            Session("isAuthedicate") = False
            Session("User") = "Un Authorized User"
            Session.Abandon()
            Session.Clear()
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        'Database Connection Establish
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            'Store system generated Captcha value in sys_captch
            Dim Sys_Captcha As String = Session("Captcha").ToString()
            'Store User Enter Captcha value in User_captcha
            Dim Usr_Captcha As String = txtCaptcha.Text
            Dim CountRow As Integer
            Dim Name As String
            ' Validate Captcha
            If Sys_Captcha = Usr_Captcha Then
                'Retrive correspoding value from database
                cmd.CommandText = "select count(*) from login where UserName=@UserName and Password=@Password  COLLATE SQL_Latin1_General_CP1_CS_AS"
                cmd.Parameters.AddWithValue("@UserName", txtUsername.Text)
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text)
                'Store the value of  the no of record executed
                CountRow = cmd.ExecuteScalar()
                'Retrive correspoding Full Name from db based on User Name and Password
                cmd.CommandText = "select FullName from login where UserName=@LoginUserName and Password=@LoginPassword  COLLATE SQL_Latin1_General_CP1_CS_AS"
                cmd.Parameters.AddWithValue("@LoginUserName", txtUsername.Text)
                cmd.Parameters.AddWithValue("@LoginPassword", txtPassword.Text)
                Name = cmd.ExecuteScalar()
                'If True Validate Username & Password From Db
                If CountRow > 0 Then
                    'Store Session('isAuthndicate') as true & Session('User') as Username
                    Session("isAuthedicate") = True
                    'Store Full Name in session
                    Session("FullName") = Name
                    Session("UserName") = txtUsername.Text
                    'Navigate to Registration page
                    Response.Redirect("~/Student/Registration.aspx", True)
                Else
                    'clear UserName and captcha text box
                    txtUsername.Text = ""
                    txtCaptcha.Text = ""
                    'display the Error
                    Error_Message("Either User Name or Password is worng!!")
                End If

            Else

                'clear captcha text box
                txtCaptcha.Text = ""
                'display the captcha is mismatch
                Error_Message("Enter Correct Captcha")
            End If

        Catch ex As Exception
            Error_Message(ex.Message)

        Finally
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
    ''' Show Custom Error Message
    ''' </summary>
    ''' <param name="msg"></param>
    ''' <remarks></remarks>
    Sub Error_Message(msg As String)
        msg = msg.Replace("'", "")
        Dim Rgx As New Regex("\r\n|\r|\n+")
        msg = Rgx.Replace(msg, "<br />")
        ScriptManager.RegisterStartupScript(Me, GetType(Page), Guid.NewGuid().ToString(), "Error_Msg('" + msg + "');", True)
    End Sub

End Class