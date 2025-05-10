using System;
using System.Linq;
using System.Web.UI.WebControls;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptServices.ItemCommand += rptServices_ItemCommand;

            if (!IsPostBack)
            {
                LoadServices();
            }
        }

        private void LoadServices()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var services = context.Services.ToList();
                rptServices.DataSource = services;
                rptServices.DataBind();
            }
        }


        protected void rptServices_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteService")
            {
                int serviceId = Convert.ToInt32(e.CommandArgument);
                using (var context = ApplicationDbContext.Create())
                {
                    var service = context.Services.FirstOrDefault(s => s.Id == serviceId);
                    if (service != null)
                    {
                        context.Services.Remove(service);
                        context.SaveChanges();
                        LoadServices(); 
                    }
                }
            }
        }


    }
}
