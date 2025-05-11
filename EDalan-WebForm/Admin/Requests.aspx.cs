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
            string commandName = e.CommandName;
            string commandArgument = e.CommandArgument.ToString(); 

            using (var context = ApplicationDbContext.Create())
            {
                var request = context.Requests.FirstOrDefault(r => r.RequestId == commandArgument);
                if (request != null)
                {
                    if (commandName == "Approve" || commandName == "Reject")
                    {
                        request.Status = commandName == "Approve" ? "Approved" : "Rejected";
                        context.SaveChanges();

                        ScriptManager.RegisterStartupScript(this, GetType(), "statusSuccess",
                            $"Swal.fire('Success', 'Request has been {request.Status.ToLower()}!', 'success');", true);
                    }
                    else if (commandName == "Delete")
                    {
                        context.Requests.Remove(request);
                        context.SaveChanges();

                        Helpers.AlertHelper.ShowSuccess(this.Page, "Deleted successfully!");

                    }

                    LoadRequests();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "invalidId",
                        "Swal.fire('Error', 'Request not found!', 'error');", true);
                }
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
