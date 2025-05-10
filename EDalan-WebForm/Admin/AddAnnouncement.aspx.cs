using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class AddAnnouncement : System.Web.UI.Page
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
                Response.Redirect("~/Admin/Announcement.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            txtTitle.Text = "";
            txtDescription.Text = "";
        }
    }
}