<%@ Page Title="Edit Announcement" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditAnnouncement.aspx.cs" Inherits="EDalan_WebForm.Admin.EditAnnouncement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h2>Edit Announcement</h2>
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
