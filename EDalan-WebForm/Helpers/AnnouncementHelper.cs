using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDalan_WebForm.Helpers
{
    public class AnnouncementHelper
    {
        public static string GetIcon(string title)
        {
            title = title.ToLower();
            if (title.Contains("clean") || title.Contains("cleanup") || title.Contains("drive")) return "🧹";
            if (title.Contains("power") || title.Contains("interruption")) return "💡";
            if (title.Contains("assembly") || title.Contains("meeting")) return "📢";
            if (title.Contains("health") || title.Contains("vaccine")) return "🩺";
            if (title.Contains("fire")) return "🔥";
            return "🗓️";
        }
    }
}