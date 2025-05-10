using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNet.Identity.EntityFramework;

namespace EDalan_WebForm.Models
{
    public class ApplicationUser : IdentityUser
    {
        [Required(ErrorMessage = "Full Name is required.")]
        [Display(Name = "Full Name")]
        public string FullName { get; set; }

        public string ContactNumber { get; set; }

        public string Address { get; set; }

        public string ProfileImage { get; set; }

        [Required]
        public string Role { get; set; }

        [Required]
        public bool IsActive { get; set; }

        public virtual ICollection<Request> Requests { get; set; }

        public ApplicationUser()
        {
            Requests = new List<Request>();
        }
    }
}
