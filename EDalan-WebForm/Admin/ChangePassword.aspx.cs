using System;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using System.Web;


namespace EDalan_WebForm.Admin
{
    public partial class ChangePassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Auth/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected async void btnChangePassword_Click(object sender, EventArgs e)
        {
            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (newPassword != confirmPassword)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Error!', 'New password and confirmation do not match.', 'error');", true);
                return;
            }

            var userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userId = User.Identity.GetUserId();

            IdentityResult result = await userManager.ChangePasswordAsync(userId, currentPassword, newPassword);

            if (result.Succeeded)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Success!', 'Password updated successfully.', 'success');", true);
            }
            else
            {
                string errorMessage = string.Join("<br/>", result.Errors);
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"Swal.fire('Error!', '{errorMessage}', 'error');", true);
            }
        }
    }
}
