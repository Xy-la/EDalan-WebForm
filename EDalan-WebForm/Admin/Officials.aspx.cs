using System;
using System.Linq;
using System.Web.UI;
using EDalan_WebForm.Models;
using EDalan.Services;
using System.Web.UI.WebControls;
using FileUploadService = EDalan.Services.FileUpload;

namespace EDalan_WebForm.Admin
{
    public partial class Officials : EDalan_WebForm.Helpers.BaseAdminPage
    {
        private FileUploadService fileUploadService => new FileUploadService(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            rptOfficials.ItemCommand += rptOfficials_ItemCommand;

            if (!IsPostBack)
            {
                LoadOfficials();
            }
        }

        private void LoadOfficials()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var officials = context.Officials.ToList();
                rptOfficials.DataSource = officials;
                rptOfficials.DataBind();
            }
        }

        protected void rptOfficials_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteOfficial")
            {
                int officialId = Convert.ToInt32(e.CommandArgument);
                using (var context = ApplicationDbContext.Create())
                {
                    var official = context.Officials.FirstOrDefault(o => o.Id == officialId);
                    if (official != null)
                    {
                        context.Officials.Remove(official);
                        context.SaveChanges();
                        LoadOfficials();
                        Helpers.AlertHelper.ShowSuccess(this.Page, "Official deleted successfully!");
                    }
                }
            }
        }
    }
}
