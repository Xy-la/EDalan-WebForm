using System;
using System.Web;
using System.Web.UI;

namespace EDalan_WebForm.Helpers
{
    public static class AlertHelper
    {
        public static void ShowSuccessAndRedirect(Page page, string message, string redirectUrl)
        {
            string script = $@"
Swal.fire({{
    title: 'Success!',
    text: '{message}',
    icon: 'success',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true
}}).then(() => {{
    window.location.href = '{redirectUrl}';
}});";

            ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", script, true);
        }

        public static void ShowSuccess(Page page, string message)
        {
            string script = $@"
Swal.fire({{
    title: 'Success!',
    text: '{message}',
    icon: 'success',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true
}});";

            ScriptManager.RegisterStartupScript(page, page.GetType(), "successAlert", script, true);
        }

        public static void ShowError(Page page, string message)
        {
            string script = $@"
Swal.fire({{
    title: 'Error!',
    text: '{message}',
    icon: 'error',
    confirmButtonText: 'OK'
}});";

            ScriptManager.RegisterStartupScript(page, page.GetType(), "errorAlert", script, true);
        }

    }
}
