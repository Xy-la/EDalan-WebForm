<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EDalan_WebForm.Auth.Register" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center">
        <div class="col-md-6 form">
            <div class="form-container">
                <h3 class="fw-bold text-center">Resident Registration</h3>

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
                    <asp:Button ID="btnRegister" runat="server" Text="Submit" CssClass="btn auth-btn" OnClick="btnRegister_Click" />
                </div>

                <div class="mt-3">
                    <p class="mb-1 text-muted-sm">
                        Already have an account?
                        <a href="Login.aspx" class="text-success fw-semibold">Sign In</a>
                    </p>
                    <span class="text-warning d-block text-wrap">
                        Note: Please verify your email after submission to complete registration.
                    </span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
