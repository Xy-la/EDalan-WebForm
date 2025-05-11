<%@ Page Title="Add User" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="EDalan_WebForm.Admin.AddUser" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center">
        <div class="col-md-6 form">
            <div class="form-container">
                       <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Add User</h3>
            <a href="/Admin/Users.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

                <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger d-block" Visible="false"></asp:Label>
                <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success d-block" Visible="false"></asp:Label>

                <div class="form-group mb-3">
                    <label for="txtFullName">Full Name</label>
                    <input type="text" id="txtFullName" runat="server" class="form-control" placeholder="Enter your full name" />
                </div>

                <div class="form-group mb-3">
                    <label for="txtEmail">Email</label>
                    <input type="email" id="txtEmail" runat="server" class="form-control" placeholder="Enter email" />
                </div>

                <div class="form-group mb-3">
                    <label for="txtPassword">Password</label>
                    <input type="password" id="txtPassword" runat="server" class="form-control" placeholder="Enter your password" />
                </div>

                <div class="form-group mb-3">
                    <label for="txtContactNumber">Contact Number</label>
                    <input type="text" id="txtContactNumber" runat="server" class="form-control" placeholder="Enter your contact number" />
                </div>

                <div class="form-group mb-3">
                    <label for="txtAddress">Address</label>
                    <input type="text" id="txtAddress" runat="server" class="form-control" placeholder="Enter your address" />
                </div>

                <div class="form-group mb-3">
                    <label for="fuProfileImage">Profile Image (Optional)</label>
                    <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="form-control" />
                </div>

                <div class="d-grid mb-3">
                    <asp:Button ID="btnRegister" runat="server" Text="Submit" CssClass="btn btn-primary w-100" OnClick="btnRegister_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
