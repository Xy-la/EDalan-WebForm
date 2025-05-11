using System;
using System.Linq;
using System.Web.UI;
using EDalan_WebForm.Models;
using EDalan.Services;
using System.Web.UI.WebControls;
using FileUploadService = EDalan.Services.FileUpload;

namespace EDalan_WebForm.Admin
{
    public partial class AddOfficial : EDalan_WebForm.Helpers.BaseAdminPage
    {
        private FileUploadService fileUploadService => new FileUploadService();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddOfficial_Click(object sender, EventArgs e)
        {
            string imageUrl = null;

            if (fuProfileImage.HasFile)
            {
                imageUrl = fileUploadService.UploadFile(fuProfileImage.PostedFile, "officials");
            }

            using (var context = ApplicationDbContext.Create())
            {
                var newOfficial = new OfficialModel
                {
                    Name = txtName.Text,
                    Position = txtPosition.Text,
                    ProfileImage = imageUrl,
                    IsActive = chkIsActive.Checked
                };

                context.Officials.Add(newOfficial);
                context.SaveChanges();
                EDalan_WebForm.Helpers.AlertHelper.ShowSuccessAndRedirect(this, "Added successfully.", "/Admin/Officials.aspx");
            }

            txtName.Text = "";
            txtPosition.Text = "";
            chkIsActive.Checked = false;
        }

    }
}
