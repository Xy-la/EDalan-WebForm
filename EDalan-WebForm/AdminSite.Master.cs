using System.Web;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using EDalan_WebForm.Models;
using Microsoft.Owin;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;



namespace EDalan_WebForm
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var userId = Context.User.Identity.GetUserId();
                var user = GetUserById(userId);

                if (user != null)
                {
                    imgProfile.ImageUrl = string.IsNullOrEmpty(user.ProfileImage) ? "~/Content/images/default.jpg" : user.ProfileImage;
                    lblFullName.Text = user.FullName;
                    lblEmail.Text = user.Email;
                }
                else
                {
                    Response.Redirect("~/Auth/AdminLogin.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        private ApplicationUser GetUserById(string userId)
        {
            var userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = userManager.FindById(userId);
            return user;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authManager = HttpContext.Current.GetOwinContext().Authentication;
            authManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);

            Response.Redirect("~/Auth/AdminLogin.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
