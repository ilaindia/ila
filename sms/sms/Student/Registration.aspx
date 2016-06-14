<%@ Page Title="Student Registration" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Registration.aspx.vb" Inherits="sms.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Panel ID="pnList" runat="server" class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-bar-chart-o fa-fw"></i>
                &nbsp; Student List
                <div class="pull-right">
                    <div class="btn-group">
                        <asp:LinkButton ID="btnAddNew" runat="server" OnClick="btnAddNew_Click" CssClass="btn btn-default btn-xs"><i class="fa fa-plus-square"></i>&nbsp;Add New</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <%--Grid View For List All The Information--%>
                        <asp:GridView ID="gvListview" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found..!">
                            <Columns>
                                <asp:BoundField DataField="PK_Studentid" HeaderText="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="DOB" HeaderText="Date Of Birth" />
                                <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" />
                                <asp:BoundField DataField="FK_DepartmentID" HeaderText="Department" />
                                <asp:TemplateField HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfStudentID" runat="server" Value='<%#Eval("PK_Studentid")%>' />
                                        <asp:LinkButton ID="btnEdit" title="Edit" CommandName="EditData" CommandArgument="<%#Container.DataItemIndex%>" OnCommand="btnEdit_Delete_Command" Text="Edit" CssClass="btn btn-sm btn-primary" runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" title="Delete" OnClientClick="return Confirm_Msg(this, 'Do You Want To Delete Record...?', '');" OnCommand="btnEdit_Delete_Command" CommandName="DeleteData" CommandArgument="<%#Container.DataItemIndex%>" CssClass="btn btn-sm btn-danger" runat="server"><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnEntry" runat="server" class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-bar-chart-o fa-fw"></i>
                &nbsp; Student Entry
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                        <%----- Student ID -----%>
                        <div class="form-group">
                            <label>ID</label>
                            <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group">
                            <%----- Name -----%>
                            <label>Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" MaxLength="50" />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name Can't be Empty"
                                ControlToValidate="txtName" ValidationGroup="StudentRegistrationValidation" CssClass="Validation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revname" runat="server" ErrorMessage="Letters And Space Only Are Allowed" ControlToValidate="txtName" CssClass="Validation" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="StudentRegistrationValidation" />
                        </div>
                        <%----- DOB -----%>
                        <div class="form-group">
                            <asp:Label ID="lblDob" runat="server">Date Of Birth</asp:Label>
                            <asp:TextBox runat="server" ID="txtDob" CssClass="form-control" placeholder="dd/mm/yyyy" />
                            <asp:RegularExpressionValidator ID="revDob" runat="server" ErrorMessage="enter dob in correct format"
                                ControlToValidate="txtDob" ValidationGroup="StudentRegistrationValidation"
                                ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" CssClass="Validation"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rvfDob" runat="server" ControlToValidate="txtDob" ValidationGroup="StudentRegistrationValidation" CssClass="Validation" ErrorMessage="Please Enter your Dob" />
                        </div>
                        <%----- Gender-----%>
                        <div class="form-group">
                            <label>Gender</label>
                            <div class="input-group">
                                <asp:RadioButton Text="Male" ID="rdMale" GroupName="Gender" runat="server" />
                                <asp:RadioButton Text="Female" ID="rdFemale" GroupName="Gender" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <%----- Caste -----%>
                        <div class="form-group">
                            <label>Caste</label>
                            <asp:DropDownList runat="server" ID="ddlCaste" CssClass="form-control">
                                <asp:ListItem Text="-Please Select-" Value="0" Selected="True" />
                                <asp:ListItem Text="MBC" Value="MBC" />
                                <asp:ListItem Text="BC" Value="BC" />
                                <asp:ListItem Text="SC" Value="SC" />
                                <asp:ListItem Text="ST" Value="ST" />
                                <asp:ListItem Text="OC" Value="OC" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlcaste" runat="server" ControlToValidate="ddlCaste" InitialValue="0" CssClass="Validation" ErrorMessage="Please Select Caste" ValidationGroup="StudentRegistrationValidation" />
                        </div>
                        <%----- Department -----%>
                        <div class="form-group">
                            <label>Department</label>
                            <asp:DropDownList runat="server" ID="ddlDepartment" CssClass="form-control" DataValueField="Pk_DepartmentID" DataTextField="DepartmentName">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvdepartment" CssClass="Validation" InitialValue="0" runat="server" ControlToValidate="ddlDepartment" ErrorMessage="Please select Department" ValidationGroup="StudentRegistrationValidation" />
                        </div>
                        <%----- Mobile No-----%>
                        <div class="form-group">
                            <label>Mobile</label>
                            <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control integer"/>
                            <asp:RegularExpressionValidator ID="revmobile" runat="server" ErrorMessage="enter valid mobile number"
                                ValidationGroup="StudentRegistrationValidation"
                                ValidationExpression="^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$" ControlToValidate="txtMobile" CssClass="Validation"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvmobile" runat="server" CssClass="Validation" ControlToValidate="txtMobile" ValidationGroup="StudentRegistrationValidation" ErrorMessage="Please enter your Mobile no" ValidationExpression="^[A-Za-z ]+$" />
                        </div>
                        <%-----Date of Joining-----%>
                        <div class="form-group">
                            <label>Date of joining</label>
                            <asp:TextBox runat="server" ID="txtDoj" CssClass="form-control" placeholder="dd/mm/yyyy" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="enter doj in correct format"
                                ControlToValidate="txtDoj" ValidationGroup="StudentRegistrationValidation"
                                ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" CssClass="Validation"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvdoj" runat="server" CssClass="Validation" ControlToValidate="txtDoj" ValidationGroup="StudentRegistrationValidation" ErrorMessage="please enter Doj" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <%----- Blood Group -----%>
                        <div class="form-group">
                            <label>Blood Group</label>
                            <asp:DropDownList runat="server" ID="ddlBloodGroup" CssClass="form-control">
                                <asp:ListItem Text="-Please Select-" Value="0" Selected="True" />
                                <asp:ListItem Text="O+" Value="O+" />
                                <asp:ListItem Text="O−" Value="O-" />
                                <asp:ListItem Text="A+" Value="A+" />
                                <asp:ListItem Text="A−" Value="A-" />
                                <asp:ListItem Text="B+" Value="B+" />
                                <asp:ListItem Text="B−" Value="B-" />
                                <asp:ListItem Text="AB+" Value="AB+" />
                                <asp:ListItem Text="AB−" Value="AB-" />
                                <asp:ListItem Text="A1B+" Value="A1B+" />
                                <asp:ListItem Text="A1B-" Value="A1B-" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvBloodGroup" runat="server" ControlToValidate="ddlBloodGroup" InitialValue="0" CssClass="Validation" ValidationGroup="StudentRegistrationValidation" ErrorMessage="Please select blood group" />
                        </div>
                        <div class="form-group">
                            <%-----Father Name -----%>
                            <label>Father Name</label>
                            <asp:TextBox runat="server" ID="TxtFatherName" CssClass="form-control" MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RfvtxtFatherName" runat="server" ErrorMessage="Can't be Empty"
                                ControlToValidate="TxtFatherName" ValidationGroup="StudentRegistrationValidation" CssClass="Validation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RevFatherName" runat="server" ErrorMessage="letters and space only are allowed" ControlToValidate="TxtFatherName" CssClass="Validation" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="StudentRegistrationValidation" />
                        </div>
                        <div class="form-group">
                            <%----- Mother Name -----%>
                            <label>Mother Name</label>
                            <asp:TextBox runat="server" ID="TxtMotherName" CssClass="form-control" MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RfvMotherName" runat="server" ErrorMessage="Can't be Empty"
                                ControlToValidate="TxtMotherName" ValidationGroup="StudentRegistrationValidation" CssClass="Validation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RevMotherName" runat="server" ErrorMessage="letters and space only are allowed" ControlToValidate="TxtMotherName" CssClass="Validation" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="StudentRegistrationValidation" />
                        </div>
                        <div class="form-group">
                            <%----- Boarding Type-----%>
                            <label>Boarding</label>
                            <asp:DropDownList runat="server" ID="ddlBoarding" CssClass="form-control">
                                <asp:ListItem Text="-Please Select-" Value="0" Selected="True" />
                                <asp:ListItem Text="Regular" Value="Regular" />
                                <asp:ListItem Text="Hostel" Value="Hostel" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rvfddlBoarding" runat="server" InitialValue="0" ValidationGroup="StudentRegistrationValidation" CssClass="Validation" ControlToValidate="ddlBoarding" ErrorMessage="Please select Boarding" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <%----- Address-----%>
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" Rows="2" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Please fill your address" CssClass="Validation" ValidationGroup="StudentRegistrationValidation" ControlToValidate="txtAddress" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="pull-right">
                        <div class="btn-group">
                            <%-----To Stored All Information-----%>
                            <asp:LinkButton ID="btnSave" OnClientClick="return Confirm_Msg(this,'Do You Want To Save Record...?', 'StudentRegistrationValidation');" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                            <%-----To Update All Information------%>
                            <asp:LinkButton ID="btnUpdate" OnClientClick="return Confirm_Msg(this,'Do You Want To Update Record...?', 'StudentRegistrationValidation');" OnClick="btnUpdate_Click" runat="server" Style="margin-left: 5px;" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Update</asp:LinkButton>
                            <%-----To Clear All Info & Go back------%>
                            <asp:LinkButton ID="btnCancel" OnClientClick="return Confirm_Msg(this,'Do You Want To Discard.. Unsaved Progress Will Not Saved..?', '');" OnClick="btnClear_Click" runat="server" Style="margin-left: 5px; margin-right: 10px" CssClass="btn btn-warning btn-sm"><i class="fa fa-save"></i>&nbsp;Cancel</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:HiddenField ID="hfValue" runat="server" />
    </div>
</asp:Content>
