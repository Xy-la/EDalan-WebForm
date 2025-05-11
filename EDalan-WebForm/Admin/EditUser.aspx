<%@ Page Title="Edit User" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="EDalan_WebForm.Admin.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Edit User</h3>
            <a href="/Admin/Users.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>
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
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary w-100" OnClientClick="return validateFileUpload();" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    function validateFileUpload() {
        var fileInput = document.getElementById('<%= fileUploadProfileImage.ClientID %>');
        var file = fileInput.files[0];

        if (file) {
            var maxSize = 4 * 1024 * 1024;  
            if (file.size > maxSize) {
                Swal.fire({
                    icon: 'error',
                    title: 'Upload Failed',
                    text: 'File size must be 4MB or less.',
                    confirmButtonColor: '#3085d6'
                });
                return false; 
            }
        }
        return true;
    }
</script>

</asp:Content>
