<%@ Page Title="Success" Language="C#" MasterPageFile="~/UserSite.master" AutoEventWireup="True" CodeBehind="Success.aspx.cs" Inherits="EDalan_WebForm.User.Success" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="alert alert-success" role="alert">
    <strong>Success!</strong> Your request has been submitted successfully. You will be notified once it's approved.
</div>
<a href='<%= ResolveUrl("~/User/Requests.aspx") %>' class="btn btn-primary">Go Back to My Requests</a>
</asp:Content>

