using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class AddAnnouncement : EDalan_WebForm.Helpers.BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddAnnouncement_Click(object sender, EventArgs e)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var newAnnouncement = new EDalan_WebForm.Models.Announcement
                {
                    Title = txtTitle.Text,
                    Description = txtDescription.Text,
                    Date = DateTime.Now
                };

                context.Announcements.Add(newAnnouncement);
                context.SaveChanges();
                EDalan_WebForm.Helpers.AlertHelper.ShowSuccessAndRedirect(this, "Added successfully.", "/Admin/Announcement.aspx");
            }

            txtTitle.Text = "";
            txtDescription.Text = "";
        }
    }
}