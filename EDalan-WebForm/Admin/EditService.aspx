<%@ Page Title="Edit Service" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditService.aspx.cs" Inherits="EDalan_WebForm.Admin.EditService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h2>Edit Service</h2>
        <div class="mb-3">
            <asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-control" Placeholder="Title" />
            <asp:TextBox ID="txtEditDescription" runat="server" CssClass="form-control mt-2" Placeholder="Description" />
            <asp:DropDownList ID="ddlIsActive" runat="server" CssClass="form-control mt-2">
    <asp:ListItem Text="Active" Value="true" />
    <asp:ListItem Text="Inactive" Value="false" />
</asp:DropDownList>
            <asp:Button ID="btnUpdateService" runat="server" CssClass="btn btn-primary mt-2" Text="Update Service" OnClick="btnUpdateService_Click" />
        </div>
    </div>
</asp:Content>
