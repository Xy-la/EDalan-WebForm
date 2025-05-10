<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/UserSite.master" AutoEventWireup="True" CodeBehind="Dashboard.aspx.cs" Inherits="EDalan_WebForm.User.Dashboard" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container py-4">
        <h2 class="mb-4">Welcome to E-DALAN, <asp:Label ID="lblFullName" runat="server" Text="User's Full Name"></asp:Label>!</h2>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-calendar-event-fill display-5 text-primary"></i>
                        <h5 class="mt-3">My Appointments</h5>
                        <p class="text-muted">View or manage your upcoming barangay appointments.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-megaphone-fill display-5 text-success"></i>
                        <h5 class="mt-3">Announcements</h5>
                        <p class="text-muted">Stay updated with recent barangay announcements.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-clipboard-data-fill display-5 text-info"></i>
                        <h5 class="mt-3">Request History</h5>
                        <p class="text-muted">Track your past requests and their statuses.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <h4 class="mb-3">Recent Announcements</h4>
            <div class="list-group">
                <asp:Repeater ID="lstAnnouncements" runat="server">
                    <ItemTemplate>
                        <a href="#" class="list-group-item list-group-item-action">
                            <h6 class="mb-1"><%# Eval("Title") %></h6>
                            <small class="text-muted">Posted on <%# Eval("Date", "{0:MMMM dd, yyyy}") %></small>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
