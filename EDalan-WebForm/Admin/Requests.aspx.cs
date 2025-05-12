using System;
using System.Linq;
using System.Web.UI.WebControls;
using EDalan_WebForm.Models;
using EDalan.Services;
using System.Web.UI;

namespace EDalan_WebForm.Admin
{
    public partial class Requests : EDalan_WebForm.Helpers.BaseAdminPage
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
            if (e.CommandName == "DeleteRequest")
            {
                int requestId = Convert.ToInt32(e.CommandArgument);
                using (var context = ApplicationDbContext.Create())
                {
                    var request = context.Requests.FirstOrDefault(r => r.Id == requestId);
                    if (request != null)
                    {
                        context.Requests.Remove(request);
                        context.SaveChanges();
                        LoadRequests(); 
                        Helpers.AlertHelper.ShowSuccess(this.Page, "Request deleted successfully!");
                    }
                }
            }
        }
    }
}
