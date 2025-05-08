using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using EDalan_WebForm.Models;
using System.Threading.Tasks;
using EDalan.Services;

namespace EDalan_WebForm.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        protected void Page_Load(object sender, EventArgs e)
        {
            _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            _signInManager = HttpContext.Current.GetOwinContext().Get<ApplicationSignInManager>();
        }

        protected async void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                litError.Text = "<div class='alert alert-danger'>Please enter both email and password.</div>";
                litError.Visible = true;
                return;
            }

            var user = await _userManager.FindByEmailAsync(email);

            if (user == null)
            {
                litError.Text = "<div class='alert alert-danger'>Invalid email or password.</div>";
                litError.Visible = true;
                return;
            }

            if (!user.IsActive)
            {
                litError.Text = "<div class='alert alert-danger'>Your account is not active. Please contact support.</div>";
                litError.Visible = true;
                return;
            }

            var result = await _signInManager.PasswordSignInAsync(user.Email, password, isPersistent: false, shouldLockout: false);

            if (result == SignInStatus.Success)
            {
                Response.Redirect("~/User/Index.aspx");
            }
            else
            {
                litError.Text = "<div class='alert alert-danger'>Invalid email or password.</div>";
                litError.Visible = true;
            }
        }
    }
}
