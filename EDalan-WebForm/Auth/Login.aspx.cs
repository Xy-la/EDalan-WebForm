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

            if (!IsPostBack)
            {
                pnlError.Visible = false;
                pnlSuccess.Visible = false;
            }
        }

        protected async void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowError("Please enter both email and password.");
                return;
            }

            var user = await _userManager.FindByEmailAsync(email);

            if (user == null || !await _userManager.CheckPasswordAsync(user, password))
            {
                ShowError("Invalid email or password.");
                return;
            }

            if (!user.IsActive)
            {
                ShowError("Your account is not active. Please contact support.");
                return;
            }

            var result = await _signInManager.PasswordSignInAsync(user.Email, password, isPersistent: false, shouldLockout: false);

            if (result == SignInStatus.Success)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Success!', 'Login successfully.', 'success');", true);
                Response.Redirect("~/User/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                ShowError("Invalid email or password.");
            }
        }

        private void ShowError(string message)
        {
            litError.Text = message;
            pnlError.Visible = true;
        }
    }
}
