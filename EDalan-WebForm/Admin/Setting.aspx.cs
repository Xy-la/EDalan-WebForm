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
    public partial class Setting : EDalan_WebForm.Helpers.BaseAdminPage
    {
        private ApplicationUserManager _userManager;
        private ApplicationDbContext _context;

        protected void Page_Load(object sender, EventArgs e)
        {
            _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            _context = HttpContext.Current.GetOwinContext().Get<ApplicationDbContext>();

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            var userId = User.Identity.GetUserId();
            var user = _userManager.FindById(userId);

            if (user == null)
            {
                Response.Redirect("~/Auth/Login.aspx");
                return;
            }

            txtFullName.Text = user.FullName;
            txtEmail.Text = user.Email;
            txtPhone.Text = user.ContactNumber;
            txtAddress.Text = user.Address;

            imgProfile.ImageUrl = !string.IsNullOrEmpty(user.ProfileImage)
                ? user.ProfileImage
                : "~/images/default.jpg";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var userId = User.Identity.GetUserId();
            var user = _userManager.FindById(userId);

            if (user != null)
            {
                user.ContactNumber = txtPhone.Text;
                user.Address = txtAddress.Text;

                var result = _userManager.Update(user);
                if (result.Succeeded)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Success!', 'Profile updated successfully.', 'success');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Error!', 'An error occurred while updating your profile.', 'error');", true);
                }

            }
        }
    }
}
