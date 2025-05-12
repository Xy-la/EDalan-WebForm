<%@ Page Title="Edit Request" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditRequest.aspx.cs" Inherits="EDalan_WebForm.Admin.EditRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Edit Request</h3>
            <a href="/Admin/Requests.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

        <div class="mb-3">
            <asp:Label ID="lblRequestId" runat="server" Text="Request ID: " CssClass="form-label" />
            <asp:TextBox ID="txtRequestId" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblRequestType" runat="server" Text="Type: " CssClass="form-label" />
            <asp:TextBox ID="txtRequestType" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblRequestDate" runat="server" Text="Request Date: " CssClass="form-label" />
            <asp:TextBox ID="txtRequestDate" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblStatus" runat="server" Text="Status: " CssClass="form-label" />
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                <asp:ListItem Text="Pending" Value="Pending" />
                <asp:ListItem Text="Approved" Value="Approved" />
                <asp:ListItem Text="Rejected" Value="Rejected" />
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <asp:Button ID="btnUpdateRequest" runat="server" CssClass="btn btn-primary" Text="Update Request" OnClick="btnUpdateRequest_Click" />
        </div>
    </div>
</asp:Content>
