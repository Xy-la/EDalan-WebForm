<%@ Page Title="Edit Service" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditService.aspx.cs" Inherits="EDalan_WebForm.Admin.EditService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                           <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Edit Service</h3>
            <a href="/Admin/Services.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>
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
