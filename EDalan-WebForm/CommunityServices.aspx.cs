using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EDalan_WebForm.Models;
using EDalan.Services;
using System.Linq;

namespace EDalan_WebForm
{
    public partial class CommunityServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServices();
            }
        }

        private void LoadServices()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var services = context.Services
                    .Where(s => s.IsActive)
                    .OrderBy(s => s.Title)
                    .ToList();

                rptServices.DataSource = services;
                rptServices.DataBind();
            }
        }
    }
}
