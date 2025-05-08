using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EDalan_WebForm.Models;
using EDalan.Services;
using System.Linq;


namespace EDalan_WebForm
{
    public partial class Announcements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnnouncements();
            }
        }

        private void LoadAnnouncements()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var announcements = context.Announcements
                    .OrderByDescending(a => a.Date)
                    .ToList();

                rptAnnouncements.DataSource = announcements;
                rptAnnouncements.DataBind();
            }
        }
    }
}
