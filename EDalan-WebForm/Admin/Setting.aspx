<%@ Page Title="Account Setting" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="True" CodeBehind="Setting.aspx.cs" Inherits="EDalan_WebForm.Admin.Setting" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0">Profile Information</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3 text-center">
                            <asp:Image ID="imgProfile" runat="server" CssClass="img-fluid rounded-circle" Width="150" Height="150" />
                        </div>

                        <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Visible="false" />
                        <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger" Visible="false" />

                        <asp:Panel ID="pnlProfile" runat="server">
                            <div class="mb-3">
                                <label for="txtFullName" class="form-label">Full Name</label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" ReadOnly="true" />
                            </div>
                            <div class="mb-3">
                                <label for="txtEmail" class="form-label">Email address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" ReadOnly="true" />
                            </div>
                            <div class="mb-3">
                                <label for="txtPhone" class="form-label">Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="txtAddress" class="form-label">Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                            </div>
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Save Changes" OnClick="btnUpdate_Click" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
