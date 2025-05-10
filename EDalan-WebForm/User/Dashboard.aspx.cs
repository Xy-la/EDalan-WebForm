using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using EDalan_WebForm.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Data.Entity;
using EDalan.Services;

namespace EDalan_WebForm.User
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private ApplicationUserManager _userManager;
        private ApplicationDbContext _context;

        protected void Page_Load(object sender, EventArgs e)
        {
            _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            _context = HttpContext.Current.GetOwinContext().Get<ApplicationDbContext>();

            if (!IsPostBack)
            {
                LoadUserDashboard();
            }
        }

        private async void LoadUserDashboard()
        {
            var userId = User.Identity.GetUserId(); 
            var user = await _userManager.FindByIdAsync(userId);

            if (user == null)
            {
                Response.Redirect("~/Auth/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            var announcements = await _context.Announcements
                                               .OrderByDescending(a => a.Date)
                                               .Take(5)
                                               .ToListAsync();

            lblFullName.Text = user.FullName;

            lstAnnouncements.DataSource = announcements;
            lstAnnouncements.DataBind();
        }
    }
}
