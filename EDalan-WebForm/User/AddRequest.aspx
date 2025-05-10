<%@ Page Title="New Request" Language="C#" MasterPageFile="~/UserSite.master" AutoEventWireup="True" CodeBehind="AddRequest.aspx.cs" Inherits="EDalan_WebForm.User.AddRequest" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Create a New Request</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
    <label for="txtRequestTitle" class="form-label">Request Type</label>
    <asp:TextBox ID="txtRequestTitle" runat="server" CssClass="form-control" placeholder="e.g., Barangay Clearance" />
    <asp:RequiredFieldValidator 
        ID="rfvRequestTitle" 
        runat="server" 
        ControlToValidate="txtRequestTitle"
        ErrorMessage="Request type is required."
        CssClass="text-danger"
        Display="Dynamic" />
</div>

<div class="form-group mb-4">
    <label for="txtRequestDescription" class="form-label">Description</label>
    <asp:TextBox ID="txtRequestDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Briefly describe your request" />
    <asp:RequiredFieldValidator 
        ID="rfvRequestDescription" 
        runat="server" 
        ControlToValidate="txtRequestDescription"
        ErrorMessage="Description is required."
        CssClass="text-danger"
        Display="Dynamic" />
</div>

                        <div class="text-end">
                            <asp:Button ID="btnSubmitRequest" runat="server" Text="Submit Request" OnClick="btnSubmitRequest_Click" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
