using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using EDalan.Services;
using EDalan_WebForm.Models;

namespace EDalan_WebForm
{
    public partial class Officials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOfficials();
            }
        }

        private void LoadOfficials()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var officials = context.Officials.Where(o => o.IsActive).ToList();

                rptOfficials.DataSource = officials;
                rptOfficials.DataBind();
            }
        }
    }
}
