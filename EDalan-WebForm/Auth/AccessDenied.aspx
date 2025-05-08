<%@ Page Title="Acess Denied" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="EDalan_WebForm.Auth.AccessDenied" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 d-flex align-items-center justify-content-center text-center">
    <div>
        <h2>Access Denied</h2>
        <p>You do not have permission to view this page. Please contact the administrator if you believe this is a mistake.</p>

        <a href="~/">Return to Home</a>
    </div>
    </div>
</asp:Content>
