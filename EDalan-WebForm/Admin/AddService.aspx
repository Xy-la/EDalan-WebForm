<%@ Page Title="Add Service" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="AddService.aspx.cs" Inherits="EDalan_WebForm.Admin.AddService" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center">
        <div class="col-md-6 p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                 <h3 class="fw-bold text-center text-primary mb-4">
                <i class="bi bi-gear-fill"></i> Add New Service
            </h3>
            <a href="/Admin/Services.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

            <div class="mb-3">
                <label for="txtTitle" class="form-label">Service Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Enter service title" />
                <asp:RequiredFieldValidator 
                    ID="rfvTitle" 
                    runat="server" 
                    ControlToValidate="txtTitle" 
                    ErrorMessage="Title is required." 
                    CssClass="text-danger" 
                    Display="Dynamic" />
            </div>

            <div class="mb-3">
                <label for="txtDescription" class="form-label">Service Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter service description..." />
                <asp:RequiredFieldValidator 
                    ID="rfvDescription" 
                    runat="server" 
                    ControlToValidate="txtDescription" 
                    ErrorMessage="Description is required." 
                    CssClass="text-danger" 
                    Display="Dynamic" />
            </div>

            <asp:Button ID="btnAddService" runat="server" Text="Add Service" CssClass="btn btn-success w-100 mt-3" OnClick="btnAddService_Click" />
        </div>
    </div>
</asp:Content>
