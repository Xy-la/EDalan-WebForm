using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using EDalan_WebForm.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class AddUser : EDalan_WebForm.Helpers.BaseAdminPage
    {
        private ApplicationUserManager UserManager => HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
        private FileUpload fileUploadService => new FileUpload();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void btnRegister_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;
            lblSuccess.Visible = false;

            string fullName = txtFullName.Value.Trim();
            string email = txtEmail.Value.Trim();
            string password = txtPassword.Value.Trim();
            string contactNumber = txtContactNumber.Value.Trim();
            string address = txtAddress.Value.Trim();

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Please fill in all required fields.";
                lblError.Visible = true;
                return;
            }

            var existingUser = await UserManager.FindByEmailAsync(email);
            if (existingUser != null)
            {
                lblError.Text = "This email is already registered.";
                lblError.Visible = true;
                return;
            }

            string imageUrl = null;
            if (fuProfileImage.HasFile)
            {
                imageUrl = fileUploadService.UploadFile(fuProfileImage.PostedFile, "users");
            }

            var user = new ApplicationUser
            {
                FullName = fullName,
                Email = email,
                UserName = email,
                ContactNumber = contactNumber,
                Address = address,
                Role = "Resident", 
                IsActive = true, 
                ProfileImage = imageUrl,
                Requests = new System.Collections.Generic.List<Request>()
            };

            var result = await UserManager.CreateAsync(user, password);

            if (result.Succeeded)
            {
                EDalan_WebForm.Helpers.AlertHelper.ShowSuccessAndRedirect(this, "Added successfully.", "/Admin/Users.aspx");
                return;
            }

            lblError.Text = string.Join("<br/>", result.Errors);
            lblError.Visible = true;
        }
    }
}
