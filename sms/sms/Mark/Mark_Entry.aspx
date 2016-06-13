<%@ Page Title="Mark Entry" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Mark_Entry.aspx.vb" Inherits="sms.Mark_Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="pnAlert">
        <asp:Label ID="lblMessage" runat="server" />
    </asp:Panel>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Mark Entry
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <%--  Exam Year--%>
                            <div class="form-group">
                                <label>Exam Year</label>
                                <asp:TextBox ID="txtExamYear" runat="server" CssClass="form-control" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvExamYear" runat="server" CssClass="Validation" ErrorMessage="Exam Year Is Required" ValidationGroup="MarkEntryGroup" ControlToValidate="txtExamYear" />
                                <asp:RegularExpressionValidator ID="revExamYear" runat="server" ControlToValidate="txtExamYear" ValidationExpression="^(20)[0-9]{2}$" ErrorMessage="only vaild year are allowed" ValidationGroup="MarkEntryGroup" CssClass="Validation"  ></asp:RegularExpressionValidator>
                          
                                  </div>
                        </div>
                        <%--Department--%>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Department </label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" DataTextField="Department_Name" DataValueField="Pk_DepartmentID">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" CssClass="Validation" ErrorMessage="Department Is Required" InitialValue="0" ValidationGroup="MarkEntryGroup" ControlToValidate="ddlDepartment" />
                            </div>
                        </div>
                        <%-- Exam Name--%>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Exam Name</label>
                                <asp:DropDownList ID="ddlExamName" runat="server" CssClass="form-control" DataTextField="Exam_Name" DataValueField="Slno">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvExamName" runat="server" CssClass="Validation" ErrorMessage="Exam Name Is Required" InitialValue="0" ValidationGroup="MarkEntryGroup" ControlToValidate="ddlExamName" />

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <div class="input-group">
                                    <%-- Show Button--%>
                                    <asp:Button ID="btnShow" CssClass="btn btn-primary" Text="Show Student" runat="server" OnClick="btnShow_Click" ValidationGroup="MarkEntryGroup" />
                                    <%--  Save Button--%>
                                    <asp:LinkButton ID="btnSave" OnClientClick="return Confirm_Msg(this,'Do You Want To Save Record...?', 'form1');" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success btn-sm"><i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                                    <%--Cancel Button--%>
                                    <asp:LinkButton ID="btnCancel" OnClientClick="return Confirm_Msg(this,'Do You Want To Discard.. Unsaved Progress Will Not Saved..?', '');" runat="server" Style="margin-left: 5px; margin-right: 10px" CssClass="btn btn-warning btn-sm"><i class="fa fa-save"></i>&nbsp;Cancel</asp:LinkButton>

                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <%------- Grid List------%>
                            <asp:GridView ID="gvStudentMark" runat="server" CssClass="table table-bordered table-responsive" AutoGenerateColumns="false" OnRowCreated="gvStudentMark_RowCreated" OnRowDataBound="gvStudentMark_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
