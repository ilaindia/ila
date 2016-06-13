<%@ Page Title="Mapping" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Sub_Dept_Mapping.aspx.vb" Inherits="sms.Sub_Dept_Mapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12 ">
            <asp:Panel ID="pnEntry" runat="server" class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-6">
                            Mapping
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <%--   Department Name--%>
                            <div class="form-group">
                                <label>Department Name</label>
                                <asp:DropDownList runat="server" ID="ddlDepartmentName" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartmentName_SelectedIndexChanged" CssClass="form-control" DataValueField="Department_ID" DataTextField="Department_Name">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RvfDepartmentName" runat="server" InitialValue="0" ValidationGroup="Sub_Dept_Mapping" CssClass="Validation" ControlToValidate="ddlDepartmentName" ErrorMessage="Please select department" />
                            </div>
                            <%--    Subject Name--%>
                            <div class="form-group">
                                <label class="col-md-5">subject list</label>
                                <div class="col-md-7">
                                    <asp:CheckBoxList ID="CblSubjectList" runat="server" DataTextField="Subject_Name" DataValueField="PK_SubjectID">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <%--Save Button--%>
                            <div class="form-group text-center">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" Text="Save" runat="server" ValidationGroup="Sub_Dept_Mapping" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
