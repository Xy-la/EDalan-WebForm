using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class EditUser : EDalan_WebForm.Helpers.BaseAdminPage
    {
        private FileUpload fileUploadService => new FileUpload();
        private string userId => Request.QueryString["userId"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var user = context.Users.FirstOrDefault(u => u.Id == userId);
                if (user != null)
                {
                    txtFullName.Text = user.FullName;
                    txtEmail.Text = user.Email;
                    txtContactNumber.Text = user.ContactNumber;
                    txtAddress.Text = user.Address;

                    if (!string.IsNullOrEmpty(user.ProfileImage))
                    {
                        imgProfile.Src = ResolveUrl(user.ProfileImage);
                    }
                }
            }
        }

       protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (fileUploadProfileImage.HasFile && fileUploadProfileImage.PostedFile.ContentLength > (3 * 1024 * 1024))
            {
                string script = @"
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Upload Failed',
                    text: 'Image size must be 3MB or less.',
                    confirmButtonColor: '#3085d6'
                });
            </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "FileSizeAlert", script);
                return;
            }
            using (var context = ApplicationDbContext.Create())
            {
                var user = context.Users.FirstOrDefault(u => u.Id == userId);
                if (user != null)
                {
                    user.FullName = txtFullName.Text;
                    user.Email = txtEmail.Text;
                    user.ContactNumber = txtContactNumber.Text;
                    user.Address = txtAddress.Text;

                    if (fileUploadProfileImage.HasFile)
                    {
                        string uploadedPath = fileUploadService.UploadFile(fileUploadProfileImage.PostedFile, "users");
                        if (!string.IsNullOrEmpty(uploadedPath))
                        {
                            user.ProfileImage = uploadedPath;
                        }
                    }

                    context.SaveChanges();
                    EDalan_WebForm.Helpers.AlertHelper.ShowSuccessAndRedirect(this, "Updated successfully.", "/Admin/Users.aspx");
                }
            }
        }
    }
}
