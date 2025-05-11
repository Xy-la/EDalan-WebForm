using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class Users : EDalan_WebForm.Helpers.BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserData();
            }
        }

        private void BindUserData()
        {
            using (var context = ApplicationDbContext.Create())
            {
                var users = context.Users.ToList();
                gvUsers.DataSource = users;
                gvUsers.DataBind();
            }
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                string userId = e.CommandArgument.ToString();  

                DeleteUser(userId);

                BindUserData();
            }
        }


        private void DeleteUser(string userId)
        {
            using (var context = ApplicationDbContext.Create())
            {
                var user = context.Users.FirstOrDefault(u => u.Id == userId);

                if (user != null)
                {
                    context.Users.Remove(user);
                    context.SaveChanges();
                    Helpers.AlertHelper.ShowSuccess(this.Page, "User deleted successfully!");
                }
            }
        }

    }
}
