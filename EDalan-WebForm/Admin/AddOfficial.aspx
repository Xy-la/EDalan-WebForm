<%@ Page Title="Add Official" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="AddOfficial.aspx.cs" Inherits="EDalan_WebForm.Admin.AddOfficial" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Add Official</h3>
            <a href="/Admin/Officials.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

        <div class="card shadow-sm p-4">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtName" class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator 
                        ID="rfvName" 
                        runat="server" 
                        ControlToValidate="txtName" 
                        ErrorMessage="Name is required." 
                        CssClass="text-danger small" 
                        Display="Dynamic" />
                </div>
                <div class="col-md-6">
                    <label for="txtPosition" class="form-label">Position</label>
                    <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator 
                        ID="rfvPosition" 
                        runat="server" 
                        ControlToValidate="txtPosition" 
                        ErrorMessage="Position is required." 
                        CssClass="text-danger small" 
                        Display="Dynamic" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Profile Image</label>
                    <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6 d-flex align-items-end">
                    <div class="form-check">
                        <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="chkIsActive">Is Active</label>
                    </div>
                </div>
            </div>

            <div class="text-end">
                <asp:Button ID="btnAddOfficial" runat="server" CssClass="btn btn-success" Text="Add Official" OnClick="btnAddOfficial_Click" />
            </div>
        </div>
    </div>
</asp:Content>
