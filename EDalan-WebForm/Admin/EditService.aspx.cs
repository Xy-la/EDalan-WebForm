using System;
using System.Linq;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class EditService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string serviceId = Request.QueryString["serviceId"];
                int parsedServiceId; 
                if (int.TryParse(serviceId, out parsedServiceId)) 
                {
                    LoadService(parsedServiceId);
                }
            }
        }

        private void LoadService(int serviceId)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var service = context.Services.FirstOrDefault(s => s.Id == serviceId);
                if (service != null)
                {
                    txtEditTitle.Text = service.Title;
                    txtEditDescription.Text = service.Description;
                    ddlIsActive.SelectedValue = service.IsActive ? "true" : "false";
                }
            }
        }

        protected void btnUpdateService_Click(object sender, EventArgs e)
        {
            string serviceId = Request.QueryString["serviceId"];
            int parsedServiceId;
            if (int.TryParse(serviceId, out parsedServiceId))
            {
                using (var context = ApplicationDbContext.Create())
                {
                    var service = context.Services.FirstOrDefault(s => s.Id == parsedServiceId);
                    if (service != null)
                    {
                        service.Title = txtEditTitle.Text;
                        service.Description = txtEditDescription.Text;
                        service.IsActive = ddlIsActive.SelectedValue == "true";
                        context.SaveChanges();
                    }
                }
            }

            Response.Redirect("~/Admin/Services.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

    }
}
