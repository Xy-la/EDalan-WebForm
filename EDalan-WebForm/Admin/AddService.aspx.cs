using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDalan.Services;
using EDalan_WebForm.Models;

namespace EDalan_WebForm.Admin
{
    public partial class AddService : EDalan_WebForm.Helpers.BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var newService = new ServiceModel
                {
                    Title = txtTitle.Text,
                    Description = txtDescription.Text,
                    IsActive = true
                };

                context.Services.Add(newService);
                context.SaveChanges();
                EDalan_WebForm.Helpers.AlertHelper.ShowSuccessAndRedirect(this, "Added successfully.", "/Admin/Services.aspx");

            }
            txtTitle.Text = "";
            txtDescription.Text = "";
        }

    }
}