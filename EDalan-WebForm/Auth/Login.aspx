<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EDalan_WebForm.Auth.Login" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center text-center">
        <div class="col-md-6 form">
            <div class="form-container">
                <h3 class="fw-bold">Access Account</h3>
                <p class="text-muted mb-4">Access your Barangay management system</p>
                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-danger d-flex align-items-center" Visible="false">
                    <asp:Literal ID="litError" runat="server" />
                </asp:Panel>

                <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success d-flex align-items-center" Visible="false">
                    <asp:Literal ID="litSuccess" runat="server" />
                </asp:Panel>

                <div class="form-group mb-3  text-start">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" aria-label="Email" aria-describedby="addon-wrapping" required="true" />
                </div>

                <div class="form-group text-start mb-3">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" aria-label="Password" aria-describedby="addon-wrapping" />
                </div>

                <div class="d-grid mb-3">
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn auth-btn" Text="Login" OnClick="btnLogin_Click" />
                </div>

                <div class="text-center">
                    <p class="mb-1 text-muted-sm">
                        Need to create an account?
                        <a href="Register.aspx" class="text-success fw-semibold">Sign Up</a>
                    </p>
                    <p class="mb-0 text-muted-sm">
                        <a href="AdminLogin.aspx" class="text-success fw-semibold">Login as Admin</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
