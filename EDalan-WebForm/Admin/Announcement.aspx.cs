using System;
using System.Linq;
using System.Web.UI.WebControls;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class Announcement : EDalan_WebForm.Helpers.BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptAnnouncements.ItemCommand += rptAnnouncements_ItemCommand;

            if (!IsPostBack)
            {
                LoadAnnouncements();
            }
        }

        private void LoadAnnouncements()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var announcements = context.Announcements.ToList();
                rptAnnouncements.DataSource = announcements;
                rptAnnouncements.DataBind();
            }
        }

       

        protected void rptAnnouncements_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAnnouncement")
            {
                int announcementId = Convert.ToInt32(e.CommandArgument);
                using (var context = ApplicationDbContext.Create())
                {
                    var announcement = context.Announcements.FirstOrDefault(a => a.Id == announcementId);
                    if (announcement != null)
                    {
                        context.Announcements.Remove(announcement);
                        context.SaveChanges();
                        LoadAnnouncements();
                        Helpers.AlertHelper.ShowSuccess(this.Page, "Announcement deleted successfully!");
                    }
                }
            }
        }
    }
}
