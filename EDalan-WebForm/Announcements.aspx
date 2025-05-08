<%@ Import Namespace="EDalan_WebForm.Helpers" %>
<%@ Page Title="Announcements" Language="C#" AutoEventWireup="True" CodeBehind="Announcements.aspx.cs" Inherits="EDalan_WebForm.Announcements" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-4 vh-100">
        <h2>Barangay Announcements</h2>
        <asp:Repeater ID="rptAnnouncements" runat="server">
           <ItemTemplate>
            <div class="list-group-item list-group-item-action d-flex align-items-start gap-2 mb-3">
                <div class="fs-4">
                    <%# AnnouncementHelper.GetIcon(Eval("Title").ToString()) %>
                </div>
            <div>
                    <strong><%# Eval("Title") %></strong><br />
                    <small class="text-muted"><%# Eval("Date", "{0:MMMM dd, yyyy}") %></small>
                    <p class="mb-0"><%# Eval("Description") %></p>
            </div>
           </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
