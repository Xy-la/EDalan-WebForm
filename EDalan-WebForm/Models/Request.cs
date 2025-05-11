using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace EDalan_WebForm.Models
{
    public class Request
    {
        public int Id { get; set; }

        [Required]
        public string Type { get; set; }

        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; }

        [Required]
        public string Status { get; set; } // Pending, Approved, Rejected

        public DateTime DateCreated { get; set; }

        // Foreign Key for User
        public string UserId { get; set; }

        public virtual ApplicationUser User { get; set; }

        public string RequestId { get; set; }

        public Request()
        {
            DateCreated = DateTime.Now;
        }
    }
}