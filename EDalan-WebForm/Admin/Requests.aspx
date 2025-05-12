        <%@ Page Title="Manage Requests" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="EDalan_WebForm.Admin.Requests" Async="true" %>

        <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h3 class="mb-4 text-left text-primary">Manage Requests</h3>
    
            <div class="container-fluid">
                <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover table-striped" OnRowCommand="gvRequests_RowCommand">
    <Columns>
        <asp:BoundField DataField="RequestId" HeaderText="Request Id" SortExpression="RequestId" />
        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        <asp:BoundField DataField="RequestDate" HeaderText="Request Date" SortExpression="RequestDate" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <span class='badge 
                    <%# Eval("Status").ToString() == "Approved" ? "bg-success" : 
                        Eval("Status").ToString() == "Rejected" ? "bg-danger" : 
                        "bg-warning" %>'>
                    <%# Eval("Status") %>
                </span>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="User.FullName" HeaderText="Requested By" SortExpression="User.FullName" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
            <a href='EditRequest.aspx?Id=<%# Eval("Id") %>' class="btn btn-primary btn-sm me-2">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                <asp:Button ID="btnDeleteRequest" runat="server" Text="Delete" CommandName="DeleteRequest" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure you want to delete this request?');" CssClass="btn btn-danger btn-sm" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

            </div>
        </asp:Content>
