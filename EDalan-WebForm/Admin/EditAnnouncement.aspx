<%@ Page Title="Edit Announcement" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditAnnouncement.aspx.cs" Inherits="EDalan_WebForm.Admin.EditAnnouncement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Edit Announcement</h3>
            <a href="/Admin/Announcement.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-control" Placeholder="Title" />
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtEditDescription" runat="server" CssClass="form-control mt-2" Placeholder="Description" TextMode="MultiLine" Rows="5" />
        </div>
        <div class="mb-3">
            <asp:Button ID="btnUpdateAnnouncement" runat="server" CssClass="btn btn-primary mt-2" Text="Update Announcement" OnClick="btnUpdateAnnouncement_Click" />
        </div>
    </div>
</asp:Content>
