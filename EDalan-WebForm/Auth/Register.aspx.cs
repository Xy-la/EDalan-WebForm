using System;
using System.Threading.Tasks;
using EDalan_WebForm.Models;
using EDalan.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using System.Web;

namespace EDalan_WebForm.Auth
{
    public partial class Register : System.Web.UI.Page
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

            var user = new User
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
                Session["SuccessMessage"] = "Registration successful!";
                Response.Redirect("~/Auth/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest(); 
                return;
            }

            lblError.Text = string.Join("<br/>", result.Errors);
            lblError.Visible = true;
        }
    }
}
