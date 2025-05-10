<%@ Page Title="Manage Services" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="EDalan_WebForm.Admin.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-left text-primary">Manage Services</h3>
            <a href="/Admin/AddService.aspx" class="btn btn-success btn-sm">
                <i class="bi bi-plus"></i> Add New
            </a>
        </div>

        <asp:Repeater ID="rptServices" runat="server">
            <HeaderTemplate>
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("Title") %></td>
                    <td><%# Eval("Description") %></td>
                    <td>
                        <span class='<%# (bool)Eval("IsActive") ? "badge bg-success" : "badge bg-secondary" %>'>
                            <%# (bool)Eval("IsActive") ? "Active" : "Inactive" %>
                        </span>
                    </td>
                    <td>
                        <a href="EditService.aspx?serviceId=<%# Eval("Id") %>" class="btn btn-primary btn-sm">
                            <i class="bi bi-pencil-fill"></i> Edit
                        </a>
                        <asp:LinkButton ID="btnDeleteService" runat="server"
                            CssClass="btn btn-danger btn-sm ms-2"
                            CommandName="DeleteService"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this service?');">
                            <i class="bi bi-trash-fill"></i> Delete
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
