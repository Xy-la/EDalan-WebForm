<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EDalan_WebForm.Auth.Login" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center text-center">
        <div class="col-md-6 form">
            <div class="form-container">
                <h3 class="fw-bold">Access Account</h3>
                <p class="text-muted mb-4">Access your Barangay management system</p>

                <!-- Display error messages in a div container with a CssClass -->
                <div class="alert alert-danger d-flex align-items-center" runat="server" visible="false">
                    <asp:Literal ID="litError" runat="server" Text="" />
                </div>

                <!-- Display success messages in a div container with a CssClass -->
                <div class="alert alert-success d-flex align-items-center" runat="server" visible="false">
                    <asp:Literal ID="litSuccess" runat="server" Text="" />
                </div>

                <!-- Form controls without the form tag -->
                <div class="input-group flex-nowrap mb-3">
                    <span class="input-group-text" id="addon-wrapping">
                        <i class="bi bi-person"></i>
                    </span>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" aria-label="Email" aria-describedby="addon-wrapping" required="true"></asp:TextBox>
                </div>
                <div class="input-group flex-nowrap mb-3">
                    <span class="input-group-text" id="addon-wrapping">
                        <i class="bi bi-lock"></i>
                    </span>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" aria-label="Password" aria-describedby="addon-wrapping"></asp:TextBox>
                </div>
                <div class="d-grid mb-3">
                    <!-- Button to submit the form -->
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
