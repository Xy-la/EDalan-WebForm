using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using EDalan_WebForm.Models;

namespace EDalan_WebForm.Helpers
{
    public class BaseAdminPage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            var userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userId = HttpContext.Current.User.Identity.GetUserId();

            if (string.IsNullOrEmpty(userId) || userManager == null)
            {
                HttpContext.Current.Response.Redirect("~/Auth/Login.aspx");
                return;
            }

            var user = userManager.FindById(userId);

            if (user == null || user.Role != "Admin")
            {
                HttpContext.Current.Response.Redirect("~/Auth/AccessDenied.aspx");
            }
        }
    }
}
