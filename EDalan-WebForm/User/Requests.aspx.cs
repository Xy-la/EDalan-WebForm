using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web.UI;
using EDalan_WebForm.Models;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using EDalan.Services;

namespace EDalan_WebForm.User
{
    public partial class Requests : System.Web.UI.Page
    {
        private ApplicationDbContext _context;

        public Requests()
        {
            _context = new ApplicationDbContext();
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadUserRequestsAsync();
            }
        }

        private async Task LoadUserRequestsAsync()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();

            var user = await _context.Users
                                     .FirstOrDefaultAsync(u => u.Id == userId);

            if (user == null)
            {
                Response.Redirect("~/Auth/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            var requests = await _context.Requests
                                         .Where(r => r.UserId == userId)
                                         .OrderByDescending(r => r.RequestDate)
                                         .ToListAsync();

            rptRequests.DataSource = requests;
            rptRequests.DataBind();
        }

        protected string GetStatusBadge(string status)
        {
            string cssClass = "badge ";
            switch (status.ToLower())
            {
                case "approved":
                    cssClass += "bg-success";
                    break;
                case "rejected":
                    cssClass += "bg-danger";
                    break;
                case "pending":
                default:
                    cssClass += "bg-warning text-dark";
                    break;
            }

            return $"<span class='{cssClass}'>{status}</span>";
        }
    }
}
