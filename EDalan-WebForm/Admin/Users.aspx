<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="EDalan_WebForm.Admin.Users" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-left text-primary">Manage Users</h3>

        <a href="/Admin/AddUser.aspx" class="btn btn-success btn-sm">
            <i class="bi bi-plus"></i> Add New
        </a>
    </div>

    
    <div class="container-fluid">
        <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="False" OnRowCommand="gvUsers_RowCommand">
            <Columns>
                <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                
                <asp:TemplateField HeaderText="Profile Image">
                    <ItemTemplate>
                        <img src='<%# Eval("ProfileImage") %>' alt="Profile" class="img-fluid rounded-circle" style="width: 50px; height: 50px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" SortExpression="ContactNumber" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                
                  <asp:TemplateField HeaderText="Actions" SortExpression="Actions">
                    <ItemTemplate>
                        <a href='EditUser.aspx?userId=<%# Eval("Id") %>' class="btn btn-primary btn-sm me-2">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                        <asp:LinkButton 
                            ID="btnDeleteUser" 
                            runat="server"
                            CssClass="btn btn-danger btn-sm ms-1"
                            CommandName="DeleteUser"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this official?');"
                            CausesValidation="false">
                            <i class="bi bi-trash"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
