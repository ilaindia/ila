<%@ Page Title="Subject" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Subject.aspx.vb" Inherits="sms.Subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <asp:Panel ID="pnList" runat="server" class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12">
                            Subject Entry                   
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>ID</label>
                        <asp:TextBox runat="server" ID="txtID" CssClass="form-control" Enabled="false" />
                    </div>
                    <%-------- Subject Name-------%>
                    <div class="form-group">
                        <label>Subject Name</label>
                        <asp:TextBox runat="server" ID="txtSubjectName" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvSubjectName" runat="server" ErrorMessage="Subject Name Can't Be Empty"
                            ControlToValidate="txtSubjectName" ValidationGroup="SubjectValidation" CssClass="Validation"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RevSubjectName" runat="server" ErrorMessage="Letters And Space are Only Allowed" ControlToValidate="txtSubjectName" CssClass="Validation" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="SubjectValidation" />
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="pull-right">
                            <%--Buttons--%>
                            <div class="btn-group">
                                <%-- Save Button--%>
                                <asp:LinkButton ID="btnSave" OnClientClick="return Confirm_Msg(this,'Do You Want To Save Record...?', 'SubjectValidation');" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                                <%-- Update Button--%>
                                <asp:LinkButton ID="btnUpdate" OnClientClick="return Confirm_Msg(this,'Do You Want To Update Record...?', 'SubjectValidation');" OnClick="btnUpdate_Click" runat="server" Style="margin-left: 5px;" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Update</asp:LinkButton>
                                <%-- Cancel Button--%>
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
                            Subject List                         
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <%-----Grid list for showing Subject list----%>
                            <asp:GridView ID="gvListview" runat="server"
                                CssClass="table table-bordered"
                                AutoGenerateColumns="false"
                                ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Records Found..!">
                                <Columns>
                                    <asp:BoundField DataField="PK_Subjectid" HeaderText="Subject ID" />
                                    <asp:BoundField DataField="Subject_Name" HeaderText="Subject Name" />
                                    <asp:TemplateField HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfSubject_ID" runat="server" Value='<%#Eval("PK_SubjectID")%>' />
                                            <asp:LinkButton ID="btnEdit" CommandName="EditData" OnCommand="btnEdit_Delete_Command" ToolTip="Edit" CommandArgument="<%#Container.DataItemIndex%>" Text="Edit" CssClass="btn btn-sm btn-primary" runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" OnClientClick="return Confirm_Msg(this, 'Do You Want To Delete Record...?', '');" CommandName="DeleteData" OnCommand="btnEdit_Delete_Command" ToolTip="Delete" CommandArgument="<%#Container.DataItemIndex%>" CssClass="btn btn-sm btn-danger" runat="server"><i class="fa fa-trash"></i></asp:LinkButton>
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
