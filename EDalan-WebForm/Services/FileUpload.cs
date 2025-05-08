using System;
using System.IO;
using System.Web;

namespace EDalan.Services
{
    public class FileUpload
    {
        public string UploadFile(HttpPostedFile file, string folder)
        {
            if (file == null || file.ContentLength <= 0)
                return null;

            string fileName = Path.GetFileNameWithoutExtension(file.FileName);
            string extension = Path.GetExtension(file.FileName);
            string uniqueName = $"{fileName}_{Guid.NewGuid()}{extension}";
            string folderPath = HttpContext.Current.Server.MapPath($"~/Content/{folder}");

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string filePath = Path.Combine(folderPath, uniqueName);
            file.SaveAs(filePath);

            return $"/Content/{folder}/{uniqueName}";
        }
    }
}