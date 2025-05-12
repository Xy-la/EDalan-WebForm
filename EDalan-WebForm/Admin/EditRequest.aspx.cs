using System;
using System.Linq;
using System.Web.UI;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class EditRequest : EDalan_WebForm.Helpers.BaseAdminPage
    {
        private int requestIdParsed;

        protected void Page_Load(object sender, EventArgs e)
        {
            string requestId = Request.QueryString["Id"];
            if (!string.IsNullOrEmpty(requestId))
            {
                int.TryParse(requestId, out requestIdParsed);
            }

            if (!IsPostBack)
            {
                LoadRequestDetails();
            }
        }

        private void LoadRequestDetails()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var request = context.Requests.FirstOrDefault(r => r.Id == requestIdParsed);
                if (request != null)
                {
                    txtRequestId.Text = request.RequestId;
                    txtRequestType.Text = request.Type;
                    txtRequestDate.Text = request.RequestDate.ToString("MM/dd/yyyy");
                    ddlStatus.SelectedValue = request.Status; // Ensure this matches the database values
                }
            }
        }

        protected void btnUpdateRequest_Click(object sender, EventArgs e)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var request = context.Requests.FirstOrDefault(r => r.Id == requestIdParsed);
                if (request != null)
                {
                    string selectedStatus = ddlStatus.SelectedValue;

                    if (request.Status != selectedStatus)
                    {
                        request.Status = selectedStatus;

                        try
                        {
                            int affectedRows = context.SaveChanges();
                            if (affectedRows > 0)
                            {
                                EDalan_WebForm.Helpers.AlertHelper.ShowSuccessAndRedirect(this, "Updated successfully.", "/Admin/Requests.aspx");
                            }
                            else
                            {
                                EDalan_WebForm.Helpers.AlertHelper.ShowError(this, "Update failed. No changes were made.");
                            }
                        }
                        catch (Exception ex)
                        {
                            EDalan_WebForm.Helpers.AlertHelper.ShowError(this, "An error occurred: " + ex.Message);
                        }
                    }
                    else
                    {
                        EDalan_WebForm.Helpers.AlertHelper.ShowError(this, "No changes detected. Status is already set to the selected value.");
                    }
                }
                else
                {
                    EDalan_WebForm.Helpers.AlertHelper.ShowError(this, "Request not found.");
                }
            }
        }
    }
}
