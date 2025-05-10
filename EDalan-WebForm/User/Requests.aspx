<%@ Page Title="My Requests" Language="C#" MasterPageFile="~/UserSite.master" AutoEventWireup="True" CodeBehind="Requests.aspx.cs" Inherits="EDalan_WebForm.User.Requests" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>My Requests</h3>
            <asp:Button ID="btnAddRequest" runat="server" Text="Add Request" OnClick="btnAddRequest_Click" CssClass="btn btn-primary" />
        </div>

        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <asp:Repeater ID="rptRequests" runat="server">
                    <HeaderTemplate>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Request ID</th>
                                        <th>Submission Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("RequestId") %></td>
                            <td><%# Eval("RequestDate", "{0:yyyy-MM-dd}") %></td>
                            <td>
                                <%# GetStatusBadge(Eval("Status").ToString()) %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                                </tbody>
                            </table>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
