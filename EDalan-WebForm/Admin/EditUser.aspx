<%@ Page Title="Edit User" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="EDalan_WebForm.Admin.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h2 class="mb-4 text-primary">Edit User</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group text-center">
                    <label for="ProfileImage">Profile Image:</label><br />
                    <img id="imgProfile" runat="server" class="img-fluid" style="width: 120px; height: 120px; object-fit: cover; border-radius: 5px;" />
                    <br />
                    <asp:FileUpload ID="fileUploadProfileImage" runat="server" CssClass="form-control mt-2" />
                </div>

                <div class="form-group">
                    <label for="FullName">Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label for="Email">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label for="ContactNumber">Contact Number:</label>
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label for="Address">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>

                <div class="form-group">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary w-100" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
