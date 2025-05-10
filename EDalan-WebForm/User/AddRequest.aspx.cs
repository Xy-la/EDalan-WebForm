using System;
using System.Linq;
using System.Web.UI;
using EDalan_WebForm.Models;
using Microsoft.AspNet.Identity;
using EDalan.Services;
using System.Data.Entity;

namespace EDalan_WebForm.User
{
    public partial class AddRequest : System.Web.UI.Page
    {
        private ApplicationDbContext _context;

        public AddRequest()
        {
            _context = new ApplicationDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void btnSubmitRequest_Click(object sender, EventArgs e)
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();

            var user = await _context.Users
                                     .FirstOrDefaultAsync(u => u.Id == userId);

            if (user != null)
            {
                var lastRequest = await _context.Requests
                                                .OrderByDescending(r => r.Id)
                                                .FirstOrDefaultAsync();

                string newRequestId;
                if (lastRequest != null && lastRequest.RequestId.StartsWith("EDALAN"))
                {
                    var lastNumber = int.Parse(lastRequest.RequestId.Substring(6));
                    newRequestId = "EDALAN" + (lastNumber + 1).ToString("D3");
                }
                else
                {
                    newRequestId = "EDALAN001";
                }

                if (string.IsNullOrWhiteSpace(txtRequestTitle.Text))
                {
                    return;
                }

                var newRequest = new Request
                {
                    UserId = user.Id,
                    Type = txtRequestTitle.Text.Trim(), 
                    RequestDate = DateTime.Now,
                    DateCreated = DateTime.Now,
                    Status = "Pending",
                    RequestId = newRequestId
                };

                _context.Requests.Add(newRequest);

                await _context.SaveChangesAsync();

                Response.Redirect("~/User/Success.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                Response.Redirect("~/Auth/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

    }
}