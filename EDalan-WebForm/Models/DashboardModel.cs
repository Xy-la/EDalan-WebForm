using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDalan_WebForm.Models
{
    public class DashboardModel
    {
        public int TotalUsers { get; set; }
        public int PendingRequests { get; set; }
        public int ApprovedRequests { get; set; }
        public int RejectedRequests { get; set; }
        public int ActiveUsers { get; set; }

        public List<int> MonthlyApproved { get; set; }
        public List<int> MonthlyRejected { get; set; }
        public List<Request> LatestRequests { get; set; }

        public string ProfileImage { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }

    }
}