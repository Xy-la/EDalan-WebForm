<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EDalan_WebForm.Admin.ChangePassword" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-secondary text-white">
                        <h5 class="mb-0">Change Password</h5>
                    </div>
                    <div class="card-body">
                        <asp:Literal ID="litMessage" runat="server" EnableViewState="false"></asp:Literal>

                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" />

                        <asp:Label runat="server" AssociatedControlID="txtCurrentPassword" CssClass="form-label">Current Password</asp:Label>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" />

                        <asp:Label runat="server" AssociatedControlID="txtNewPassword" CssClass="form-label mt-3">New Password</asp:Label>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" />

                        <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="form-label mt-3">Confirm New Password</asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />

                        <asp:Button ID="btnChangePassword" runat="server" Text="Update Password" CssClass="btn btn-secondary mt-3" OnClick="btnChangePassword_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
