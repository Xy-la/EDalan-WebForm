using System;
using System.Linq;
using System.Web.UI.WebControls;
using EDalan_WebForm.Models;
using EDalan.Services;
using System.Web.UI;

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
            string requestId = e.CommandArgument.ToString();

            // Attempt to safely convert requestId to an integer
            int requestIdInt;
            if (Int32.TryParse(requestId, out requestIdInt))  // Try to parse requestId to an integer
            {
                using (var context = ApplicationDbContext.Create())
                {
                    var request = context.Requests.FirstOrDefault(r => r.RequestId == requestIdInt.ToString());
                    if (request != null)
                    {
                        if (e.CommandName == "Approve" || e.CommandName == "Reject")
                        {
                            request.Status = e.CommandName == "Approve" ? "Approved" : "Rejected";
                            context.SaveChanges();

                            ScriptManager.RegisterStartupScript(this, GetType(), "statusSuccess",
                                $"Swal.fire('Success', 'Request has been {request.Status.ToLower()}!', 'success');", true);
                        }
                        else if (e.CommandName == "Delete")
                        {
                            context.Requests.Remove(request);
                            context.SaveChanges();

                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess",
                                "Swal.fire('Success', 'Request has been deleted!', 'success');", true);
                        }

                        LoadRequests();
                    }
                }
            }
            else
            {
                // Handle invalid requestId scenario
                ScriptManager.RegisterStartupScript(this, GetType(), "invalidId",
                    "Swal.fire('Error', 'Invalid request ID format!', 'error');", true);
            }
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            foreach (GridViewRow row in gvRequests.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string requestId = gvRequests.DataKeys[row.RowIndex].Value.ToString();

                    ClientScript.RegisterForEventValidation(gvRequests.UniqueID, "Approve$" + requestId);
                    ClientScript.RegisterForEventValidation(gvRequests.UniqueID, "Reject$" + requestId);
                    ClientScript.RegisterForEventValidation(gvRequests.UniqueID, "Delete$" + requestId);
                }
            }

            base.Render(writer);
        }
    }
}
