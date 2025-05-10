using System;
using System.Linq;
using System.Web.UI;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class EditOfficial : System.Web.UI.Page
    {
        private FileUpload fileUploadService => new FileUpload();
        private int OfficialId => Convert.ToInt32(Request.QueryString["officialId"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOfficial();
            }
        }

        private void LoadOfficial()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var official = context.Officials.FirstOrDefault(o => o.Id == OfficialId);

                if (official != null)
                {
                    txtName.Text = official.Name;
                    txtPosition.Text = official.Position;
                    chkIsActive.Checked = official.IsActive;

                    if (!string.IsNullOrEmpty(official.ProfileImage))
                    {
                        imgProfilePreview.ImageUrl = official.ProfileImage;
                        imgProfilePreview.Visible = true;
                    }
                    else
                    {
                        imgProfilePreview.Visible = false;
                    }
                }
                else
                {
                    lblMessage.CssClass = "text-danger";
                    lblMessage.Text = "Official not found.";
                }
            }
        }


        protected void btnUpdateOfficial_Click(object sender, EventArgs e)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var official = context.Officials.FirstOrDefault(o => o.Id == OfficialId);
                if (official != null)
                {
                    official.Name = txtName.Text.Trim();
                    official.Position = txtPosition.Text.Trim();
                    official.IsActive = chkIsActive.Checked;

                    if (fuProfileImage.HasFile)
                    {
                        string newImageUrl = fileUploadService.UploadFile(fuProfileImage.PostedFile, "officials");
                        official.ProfileImage = newImageUrl;
                    }

                    context.SaveChanges();
                    Response.Redirect("~/Admin/Officials.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    lblMessage.CssClass = "text-danger";
                    lblMessage.Text = "Unable to find the official to update.";
                }
            }
        }
    }
}
