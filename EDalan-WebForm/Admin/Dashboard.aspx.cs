using System;
using System.Linq;
using Newtonsoft.Json;
using EDalan_WebForm.Models;
using EDalan.Services;

namespace EDalan_WebForm.Admin
{
    public partial class Dashboard : EDalan_WebForm.Helpers.BaseAdminPage
    {
        public int ApprovedRequests;
        public int PendingRequests;
        public int RejectedRequests;

        public string MonthlyApprovedJson;
        public string MonthlyRejectedJson;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (var context = new ApplicationDbContext())
                {
                    ApprovedRequests = context.Requests.Count(r => r.Status == "Approved");
                    PendingRequests = context.Requests.Count(r => r.Status == "Pending");
                    RejectedRequests = context.Requests.Count(r => r.Status == "Rejected");

                    litPendingRequests.Text = PendingRequests.ToString();
                    litTotalUsers.Text = context.Users.Count().ToString();
                    litActiveUsers.Text = context.Users.Count(u => u.IsActive).ToString();

                    var currentYear = DateTime.Now.Year;

                    var monthlyApproved = new int[12];
                    var monthlyRejected = new int[12];

                    var requests = context.Requests
                        .Where(r => r.DateCreated.Year == currentYear)
                        .ToList();

                    foreach (var req in requests)
                    {
                        int monthIndex = req.DateCreated.Month - 1;
                        if (req.Status == "Approved")
                            monthlyApproved[monthIndex]++;
                        else if (req.Status == "Rejected")
                            monthlyRejected[monthIndex]++;
                    }

                    MonthlyApprovedJson = JsonConvert.SerializeObject(monthlyApproved);
                    MonthlyRejectedJson = JsonConvert.SerializeObject(monthlyRejected);


                    var pendingRequests = context.Requests
                .Where(r => r.Status == "Pending" && r.User != null)
                .OrderByDescending(r => r.RequestDate)
                .Take(10)
                .Select(r => new
                {
                    r.RequestId,
                    r.RequestDate,
                    r.Status,
                    FullName = r.User.FullName
                }).ToList();

                    rptRequests.DataSource = pendingRequests;
                    rptRequests.DataBind();

                    litNoRequests.Visible = !pendingRequests.Any();


                }
            }
        }
    }
}
