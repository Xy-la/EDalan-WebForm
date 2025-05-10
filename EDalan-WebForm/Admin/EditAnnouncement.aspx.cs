using System;
using System.Linq;
using System.Web.UI;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class EditAnnouncement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string announcementId = Request.QueryString["announcementId"];
                int parsedAnnouncementId;
                if (int.TryParse(announcementId, out parsedAnnouncementId))
                {
                    LoadAnnouncement(parsedAnnouncementId);
                }
            }
        }

        private void LoadAnnouncement(int announcementId)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var announcement = context.Announcements.FirstOrDefault(a => a.Id == announcementId);
                if (announcement != null)
                {
                    txtEditTitle.Text = announcement.Title;
                    txtEditDescription.Text = announcement.Description;
                }
            }
        }

        protected void btnUpdateAnnouncement_Click(object sender, EventArgs e)
        {
            string announcementId = Request.QueryString["announcementId"];
            int parsedAnnouncementId;
            if (int.TryParse(announcementId, out parsedAnnouncementId))
            {
                using (var context = ApplicationDbContext.Create())
                {
                    var announcement = context.Announcements.FirstOrDefault(a => a.Id == parsedAnnouncementId);
                    if (announcement != null)
                    {
                        announcement.Title = txtEditTitle.Text;
                        announcement.Description = txtEditDescription.Text;
                        announcement.Date = DateTime.Now; 

                        context.SaveChanges();
                    }
                }
            }

            Response.Redirect("~/Admin/Announcement.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
