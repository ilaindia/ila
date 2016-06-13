<%@ Page Title="Change Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Change_Password.aspx.vb" Inherits="sms.Change_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Change Password</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                             <%--   Enter Old Password--%>
                                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                               <%-- Enter New password--%>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <%--Enter Confirm Password--%>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                           <%-- Validator for Comparing New password and Confirm Password--%>
                                <asp:CompareValidator ID="CVchangepwd" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" CssClass="Validation" ErrorMessage="Password Not Match" />
                        </div>
                            </div>
                     <%--   Change Password Button--%>
                            <asp:LinkButton ID="btnChangePwd" runat="server" CssClass="btn  btn-success btn-block" Text="Change Password" OnClick="btnChangePwd_Click"></asp:LinkButton>
                       
                    </div>
                </div>
            </div>
</asp:Content>