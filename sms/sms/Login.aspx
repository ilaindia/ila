<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="sms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <%-- Style Sheet Declare  --%>
    <link href="~/asset/css/bootstrap.css" rel="stylesheet" />
    <link href="~/asset/css/Bootstrap_Sidebar.css" rel="stylesheet" />
    <link href="~/asset/css/metisMenu.css" rel="stylesheet" />

    <link href="~/asset/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <link href="~/asset/Plugin/Jq_Smart_Alert/css/alert.min.css" rel="stylesheet" />
    <link href="~/asset/Plugin/Jq_Smart_Alert/themes/default/theme.min.css" rel="stylesheet" />
    <%-- Script Declare  --%>
    <script src="/asset/js/jquery-2.2.3.min.js"></script>
    <script src="/asset/js/bootstrap.js"></script>
    <script src="/asset/js/Bootstrap_Sidebar.js"></script>
    <script src="/asset/js/metisMenu.js"></script>

    <script src="/asset/Plugin/Jq_Smart_Alert/js/alert.min.js"></script>

    <script src="/asset/js/Sms_Custom.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="form-group">
                                    <%-- Text box for User Name--%>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvUserName" ControlToValidate="txtUsername" runat="server" CssClass="Validation" ValidationGroup="LoginForm" ErrorMessage="User Name Required" />
                                </div>
                                <div class="form-group">
                                    <%-- Text Box for Password--%>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvPassword" ControlToValidate="txtPassword" runat="server" CssClass="Validation" ValidationGroup="LoginForm" ErrorMessage="password Required" />

                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <%--Captcha image--%>
                                        <asp:Image ID="imgCaptcha" runat="server" src="#" alt="Captcha Image" Style="width: 100%;" />
                                        <a onclick="return loadCaptcha();" class="input-group-addon" style="background: #337ab7; cursor: pointer; color: #fff"><i class="fa fa-refresh"></i></a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <%--Textbox For Entering Captcha Value--%>
                                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" placeholder="Captcha"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvCaptch" ControlToValidate="txtCaptcha" runat="server" CssClass="Validation" ValidationGroup="LoginForm" ErrorMessage="Captcha Cannot Empty" />
                                </div>
                                <%-- Button for Login--%>
                                <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-success btn-block" Text="Login" OnClick="btnLogin_Click" ValidationGroup="LoginForm"></asp:LinkButton>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        //Function Call for load Captcha 
        $(document).ready(function () {
            loadCaptcha()
        })
        function loadCaptcha() {
            //Get New captch Based on Current Time
            $('#<%:imgCaptcha.ClientID%>').attr("src", "/Gen_Captcha.aspx?" + new Date().getTime());
            return false;
        }
    </script>
</body>
</html>
