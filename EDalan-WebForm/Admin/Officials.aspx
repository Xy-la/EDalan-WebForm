<%@ Page Title="Manage Officials" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Officials.aspx.cs" Inherits="EDalan_WebForm.Admin.Officials" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary mb-0">Manage Officials</h3>
            <a href="/Admin/AddOfficial.aspx" class="btn btn-success btn-sm">
                <i class="bi bi-plus"></i> Add New
            </a>
        </div>

        <asp:Repeater ID="rptOfficials" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered table-hover table-striped align-middle">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 30%;">Name</th>
                            <th style="width: 20%;">Position</th>
                            <th style="width: 15%;">Status</th>
                            <th style="width: 20%;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <img src='<%# Eval("ProfileImage") %>' alt="Profile" class="rounded-circle me-2" style="width: 40px; height: 40px;" />
                            <span><%# Eval("Name") %></span>
                        </div>
                    </td>
                    <td><%# Eval("Position") %></td>
                    <td>
                        <span class='<%# (bool)Eval("IsActive") ? "badge bg-success" : "badge bg-secondary" %>'>
                            <%# (bool)Eval("IsActive") ? "Active" : "Inactive" %>
                        </span>
                    </td>
                    <td>
                        <a href='EditOfficial.aspx?officialId=<%# Eval("Id") %>' class="btn btn-primary btn-sm me-1">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                        <asp:LinkButton 
                            ID="btnDeleteOfficial" 
                            runat="server"
                            CssClass="btn btn-danger btn-sm"
                            CommandName="DeleteOfficial"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this official?');"
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
