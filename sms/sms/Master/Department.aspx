<%@ Page Title="Department" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Department.aspx.vb" Inherits="sms.Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <asp:Panel ID="pnList" runat="server" class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12">
                            Department Entry                   
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <%-- Department ID--%>
                    <div class="form-group">
                        <label>Department ID</label>
                        <asp:TextBox runat="server" ID="txtDeptID" CssClass="form-control" Enabled="false" />
                    </div>
                    <%--  Department Name--%>
                    <div class="form-group">
                        <label>Department Name</label>
                        <asp:TextBox runat="server" ID="txtDeptName" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvDeptName" runat="server" ErrorMessage="Department Name Can't be Empty"
                            ControlToValidate="txtDeptName" ValidationGroup="DepartmentValidation" CssClass="Validation"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Age Limit</label>
                        <asp:DropDownList runat="server" ID="ddlAgeLimit" CssClass="form-control">
                            <asp:ListItem Text="-Please Select-" Value="0" Selected="True" />
                            <asp:ListItem Text="3" Value="3" />
                            <asp:ListItem Text="4" Value="4" />
                            <asp:ListItem Text="5" Value="5" />
                            <asp:ListItem Text="6" Value="6" />
                            <asp:ListItem Text="7" Value="7" />
                            <asp:ListItem Text="8" Value="8" />
                            <asp:ListItem Text="9" Value="9" />
                            <asp:ListItem Text="10" Value="10" />
                            <asp:ListItem Text="11" Value="11" />
                            <asp:ListItem Text="12" Value="12" />
                            <asp:ListItem Text="13" Value="13" />
                            <asp:ListItem Text="14" Value="14" />
                            <asp:ListItem Text="15" Value="15" />
                            <asp:ListItem Text="16" Value="16" />
                            <asp:ListItem Text="17" Value="17" />
                            <asp:ListItem Text="18" Value="18" />
                            <asp:ListItem Text="19" Value="19" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RfvAgeLimit" runat="server" InitialValue="0" ErrorMessage="Enter Age Limit"
                            ControlToValidate="ddlAgeLimit" ValidationGroup="DepartmentValidation" CssClass="Validation"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="pull-right">
                            <%--buttons--%>
                            <div class="btn-group">
                                <%-- Save --%>
                                <asp:LinkButton ID="btnSave" OnClientClick="return Confirm_Msg(this,'Do You Want To Save Record...?', 'DepartmentValidation');" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                                <%--  Update--%>
                                <asp:LinkButton ID="btnUpdate" OnClientClick="return Confirm_Msg(this,'Do You Want To Update Record...?', 'DepartmentValidation');" OnClick="btnUpdate_Click" runat="server" Style="margin-left: 5px;" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Update</asp:LinkButton>
                                <%----- Cancel-------%>
                                <asp:LinkButton ID="btnCancel" OnClientClick="return Confirm_Msg(this,'Do You Want To Discard.. Unsaved Progress Will Not Saved..?', '');" OnClick="btnCancel_Click" runat="server" Style="margin-left: 5px; margin-right: 10px" CssClass="btn btn-warning btn-sm"><i class="fa fa-save"></i>&nbsp;Cancel</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="col-md-8">
            <asp:Panel ID="pnEntry" runat="server" class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12">
                            Department Details                   
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <%--     Grid View For List All The Information--%>
                            <asp:GridView ID="gvListview" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found..!">
                                <Columns>
                                    <asp:BoundField DataField="PK_DepartmentID" HeaderText="Department ID" />
                                    <asp:BoundField DataField="Department_Name" HeaderText="Department Name" />
                                    <asp:BoundField DataField="Age_Limit" HeaderText="Age Limit" />
                                    <asp:TemplateField HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfDept_ID" runat="server" Value='<%#Eval("PK_DepartmentID")%>' />
                                            <asp:LinkButton ID="btnEdit" CommandName="EditData" OnCommand="btnEdit_Delete_Command" ToolTip="Edit" CommandArgument="<%#Container.DataItemIndex%>" Text="Edit" CssClass="btn btn-sm btn-primary" runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" CommandName="DeleteData" OnCommand="btnEdit_Delete_Command" ToolTip="Delete" CommandArgument="<%#Container.DataItemIndex%>"
                                                OnClientClick="return Confirm_Msg(this, 'Do You Want To Delete Record...?', '');" CssClass="btn btn-sm btn-danger" runat="server"><i class="fa fa-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="hfValue" runat="server" />
            </asp:Panel>
        </div>
    </div>
</asp:Content>
