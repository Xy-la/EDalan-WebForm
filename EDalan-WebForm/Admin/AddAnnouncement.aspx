<%@ Page Title="Add Announcement" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="AddAnnouncement.aspx.cs" Inherits="EDalan_WebForm.Admin.AddAnnouncement" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <div class="card p-4 mt-4" style="max-width: 600px; width: 100%;">

                    <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold text-center text-primary mb-4">
                <i class="bi bi-megaphone-fill"></i> Add Announcement
            </h3>
            <a href="/Admin/Announcement.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

            <div class="mb-3">
                <label for="txtTitle" class="form-label">Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Enter title" />
                <asp:RequiredFieldValidator 
                    ID="rfvTitle" 
                    runat="server" 
                    ControlToValidate="txtTitle" 
                    ErrorMessage="Title is required." 
                    CssClass="text-danger" 
                    Display="Dynamic" />
            </div>

            <div class="mb-3">
                <label for="txtDescription" class="form-label">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter announcement details..." />
                <asp:RequiredFieldValidator 
                    ID="rfvDescription" 
                    runat="server" 
                    ControlToValidate="txtDescription" 
                    ErrorMessage="Description is required." 
                    CssClass="text-danger" 
                    Display="Dynamic" />
            </div>

            <div class="mb-3">
                <label for="txtDate" class="form-label">Date</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator 
                    ID="rfvDate" 
                    runat="server" 
                    ControlToValidate="txtDate" 
                    ErrorMessage="Date is required." 
                    CssClass="text-danger" 
                    Display="Dynamic" />
            </div>

            <asp:Button ID="btnAddAnnouncement" runat="server" Text="Add Announcement" CssClass="btn btn-success w-100" OnClick="btnAddAnnouncement_Click" />
        </div>
    </div>
</asp:Content>
