using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace EDalan_WebForm.Models
{
    public class UserDashboardModel
    {
        public ApplicationUser User { get; set; }

        [Required]
        public string ProfileImage { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string FullName { get; set; }

        [Required]
        public List<Announcement> Announcements { get; set; } = new List<Announcement>();

        public List<Request> Requests { get; set; } = new List<Request>();
    }
}