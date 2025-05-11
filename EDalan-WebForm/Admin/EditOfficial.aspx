<%@ Page Title="Edit Official" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditOfficial.aspx.cs" Inherits="EDalan_WebForm.Admin.EditOfficial" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
                <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Edit Official</h3>
            <a href="/Admin/Officials.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success" />

        <div class="mb-3">
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Name" />
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
        ErrorMessage="Name is required." CssClass="text-danger" Display="Dynamic" />

    <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control mt-2" Placeholder="Position" />
    <asp:RequiredFieldValidator ID="rfvPosition" runat="server" ControlToValidate="txtPosition"
        ErrorMessage="Position is required." CssClass="text-danger" Display="Dynamic" />

    <asp:Label ID="lblCurrentImage" runat="server" Text="Current Profile Image:" CssClass="form-label mt-3 d-block" />
    <asp:Image ID="imgProfilePreview" runat="server" CssClass="img-thumbnail mb-2" Width="120" Height="120" />

    <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="form-control mt-2" />
    <asp:CheckBox ID="chkIsActive" runat="server" Text="Is Active" CssClass="mt-2 d-block" />

    <asp:Button ID="btnUpdateOfficial" runat="server" CssClass="btn btn-primary mt-3" Text="Update Official"
        OnClick="btnUpdateOfficial_Click" />
    <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="Officials.aspx" CssClass="btn btn-secondary mt-3 ms-2">Cancel</asp:HyperLink>
</div>
    </div>
</asp:Content>
