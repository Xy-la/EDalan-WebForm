using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using EDalan_WebForm.Models;

namespace EDalan.Services
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        public DbSet<Announcement> Announcements { get; set; }
        public DbSet<ServiceModel> Services { get; set; }
        public DbSet<OfficialModel> Officials { get; set; }
        public DbSet<Request> Requests { get; set; }
    }
}