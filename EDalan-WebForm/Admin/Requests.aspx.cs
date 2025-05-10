using System;
using System.Linq;
using System.Web.UI.WebControls;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var requests = context.Requests
                    .OrderByDescending(r => r.RequestDate)
                    .ToList();

                gvRequests.DataSource = requests;
                gvRequests.DataBind();
            }
        }

        protected void gvRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                string requestId = e.CommandArgument.ToString();
                string newStatus = e.CommandName == "Approve" ? "Approved" : "Rejected";

                using (var context = ApplicationDbContext.Create())
                {
                    var request = context.Requests.FirstOrDefault(r => r.RequestId == requestId);
                    if (request != null)
                    {
                        request.Status = newStatus;
                        context.SaveChanges();
                    }
                }

                LoadRequests();
            }
        }

        protected void gvRequests_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string requestId = gvRequests.DataKeys[e.RowIndex].Value.ToString();

            using (var context = ApplicationDbContext.Create())
            {
                var request = context.Requests.FirstOrDefault(r => r.RequestId == requestId);
                if (request != null)
                {
                    context.Requests.Remove(request);
                    context.SaveChanges();
                }
            }

            LoadRequests();
        }
    }
}
