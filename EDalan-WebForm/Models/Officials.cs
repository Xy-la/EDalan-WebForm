using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace EDalan_WebForm.Models
{
    [Table("Officials")]
    public class OfficialModel
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Position { get; set; }

        public string ProfileImage { get; set; } = null;

        public bool IsActive { get; set; }
    }
}