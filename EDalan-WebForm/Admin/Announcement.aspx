<%@ Page Title="Manage Announcements" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="EDalan_WebForm.Admin.Announcement" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-left text-primary">
                <i class="bi bi-megaphone-fill"></i> Manage Announcements
            </h3>

            <a href="/Admin/AddAnnouncement.aspx" class="btn btn-success btn-sm">
                <i class="bi bi-plus"></i> Add New
            </a>
        </div>

        <asp:Repeater ID="rptAnnouncements" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%# Eval("Title") %></td>
                    <td><%# Eval("Description") %></td>
                    <td><%# Eval("Date", "{0:yyyy-MM-dd HH:mm}") %></td>
                    <td>
                        <a href='EditAnnouncement.aspx?announcementId=<%# Eval("Id") %>' class="btn btn-primary btn-sm me-1">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                        <asp:LinkButton 
                            ID="btnDeleteAnnouncement" 
                            runat="server"
                            CssClass="btn btn-danger btn-sm"
                            CommandName="DeleteAnnouncement"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this announcement?');"
                            CausesValidation="false">
                            <i class="bi bi-trash"></i> Delete
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
