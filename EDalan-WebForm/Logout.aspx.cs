using System;
using System.Web;

namespace EDalan_WebForm
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            System.Web.Security.FormsAuthentication.SignOut();

            Response.Redirect("~/Auth/Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
