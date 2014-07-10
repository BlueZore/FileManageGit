using System;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Web.SessionState;
using System.IO;

namespace WebApplication2
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class UploadHandler : IHttpHandler, IRequiresSessionState
    {
        string FileID = "";
        FileManageEntities db = new FileManageEntities();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";

            HttpPostedFile file = context.Request.Files["Filedata"];
            string uploadPath = context.Server.MapPath("~/upload/");
            string FileParentID = context.Request["ParentID"];

            if (file != null)
            {
                FileID = Guid.NewGuid().ToString();
                string FileType = file.FileName.Substring(file.FileName.LastIndexOf('.') + 1).ToLower();
                string FileName = file.FileName.Substring(0, file.FileName.LastIndexOf('.'));
                file.SaveAs(uploadPath + FileID + "." + FileType);
                FileID += "|" + file.FileName + "|" + FileType;

                new WebService().AddFile(FileID, FileName, FileParentID, FileType);
            }
            context.Response.Write(FileID);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
