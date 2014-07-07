using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebApplication2
{
    /// <summary>
    /// WebService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        FileManageEntities db = new FileManageEntities();

        /// <summary>
        /// 创建文件夹
        /// </summary>
        /// <param name="FileName">文件夹名</param>
        /// <param name="FileParentID">上级文件夹ID</param>
        /// <returns></returns>
        [WebMethod]
        public int CreateFile(string FileID, string FileName, string FileParentID)
        {
            var v = db.OS_Files.Where(p => p.ID == new Guid(FileParentID));
            OS_Files model = new OS_Files();
            model.ID = new Guid(FileID);
            model.Name = FileName;
            model.ParentID = new Guid(FileParentID);
            model.ParentIDs =
                v.Count() > 0 ?
                (v.First().ParentIDs + FileParentID + "|") :
                ("|" + FileParentID + "|");
            model.state = 0;
            model.ModifiedDate = model.CreatedDate = DateTime.Now;
            db.OS_Files.Add(model);
            return db.SaveChanges();
        }

        /// <summary>
        /// 重命名文件夹
        /// </summary>
        /// <param name="NewFileName">新文件夹名</param>
        /// <param name="FileID">文件夹</param>
        /// <returns></returns>
        [WebMethod]
        public int ReNameFile(string NewFileName, string FileID)
        {
            var v = db.OS_Files.Where(p => p.ID == new Guid(FileID));
            if (v.Count() > 0)
            {
                v.First().Name = NewFileName;
                db.SaveChanges();
                return 1;
            }
            return 0;
        }

        /// <summary>
        /// 删除文件夹集（节点下都能删除）
        /// </summary>
        /// <param name="FileID">文件夹ID</param>
        /// <returns></returns>
        [WebMethod]
        public int DeleteFile(string FileID)
        {
            var v = from p in db.OS_Files
                    where p.ID == new Guid(FileID) ||
                    p.ParentIDs.IndexOf(FileID) > -1
                    select p;

            db.OS_Files.RemoveRange(v);
            db.SaveChanges();
            return 1;
        }

        /// <summary>
        /// 移动文件夹集
        /// </summary>
        /// <param name="FileID">文件夹ID</param>
        /// <param name="FileParentID">移动到的上级文件夹ID</param>
        /// <returns></returns>
        [WebMethod]
        public int MoveFile(string FileID, string FileParentID)
        {
            var v = db.OS_Files.Where(p => p.ID == new Guid(FileID));
            if (v.Count() > 0)
            {
                v.First().ParentIDs = v.First().ParentIDs.Replace("|" + v.First().ParentID.ToString() + "|", "|" + FileParentID + "|");
                v.First().ParentID = new Guid(FileParentID);
                db.SaveChanges();
                return 1;
            }
            return 0;
        }

        /// <summary>
        /// 复制文件夹集
        /// </summary>
        /// <param name="FileID">文件夹ID</param>
        /// <param name="FileParentID">复制到的上级文件夹ID</param>
        /// <returns></returns>
        [WebMethod]
        public int CopyFile(string FileID, string FileParentID)
        {
            var v = from p in db.OS_Files
                    where p.ID == new Guid(FileID) || p.ParentIDs.IndexOf("|" + FileID + "|") > -1 || p.ID == new Guid(FileParentID)
                    select p;
            if (v.Count() > 0)
            {
                var _v = v.Where(p => p.ID == new Guid(FileID));
                OS_Files model = new OS_Files();
                model.ID = Guid.NewGuid();
                model.Name = _v.First().Name;
                model.ParentID = new Guid(FileParentID);
                model.ParentIDs = v.Where(p => p.ID == new Guid(FileParentID)).First().ParentIDs + FileParentID + "|";
                model.state = 0;
                model.ModifiedDate = model.CreatedDate = DateTime.Now;
                db.OS_Files.Add(model);
                ForeachCopyFile(v.ToList(), FileID, model.ID.ToString(), v.First().ParentIDs, model.ParentIDs);
                db.SaveChanges();
                return 1;
            }
            return 0;
        }

        /// <summary>
        /// 递归复制文件夹集
        /// </summary>
        /// <param name="list">集合</param>
        /// <param name="FileID">老文件夹ID</param>
        /// <param name="newFileID">新文件夹ID</param>
        /// <param name="oldParentIDs">老文件夹父级IDs</param>
        /// <param name="newParentIDs">新文件夹父级IDs</param>
        void ForeachCopyFile(List<OS_Files> list, string FileID, string newFileID, string oldParentIDs, string newParentIDs)
        {
            var v = list.Where(p => p.ParentID == new Guid(FileID));
            foreach (var _v in v)
            {
                OS_Files model = new OS_Files();
                model.ID = Guid.NewGuid();
                model.Name = _v.Name;
                model.ParentID = new Guid(newFileID);
                model.ParentIDs = _v.ParentIDs.Replace(oldParentIDs, newParentIDs) + newFileID + "|";
                model.state = 0;
                model.ModifiedDate = model.CreatedDate = DateTime.Now;
                db.OS_Files.Add(model);
                ForeachCopyFile(list, _v.ID.ToString(), model.ID.ToString(), _v.ParentIDs, model.ParentIDs);
            }
        }

        /// <summary>
        /// 获取文件夹集
        /// </summary>
        /// <param name="FileID"></param>
        /// <returns></returns>
        [WebMethod]
        public List<OS_Files> GetFiles(string FileID)
        {
            return db.OS_Files.Where(p => p.ParentID == new Guid(FileID)).OrderByDescending(p => p.CreatedDate).ToList();
        }

        /// <summary>
        /// 获取全文件夹集（树）
        /// </summary>
        /// <param name="FileID"></param>
        /// <returns></returns>
        [WebMethod]
        public string GetAllFilesForTree()
        {
            var v = db.OS_Files.OrderByDescending(p => p.CreatedDate);
            string JSON = "{ id: \"00000000-0000-0000-0000-000000000000\", pId: \"0\", name: \"全部文件\", open: true }";
            foreach (var _v in v)
            {
                JSON += ",{ id: \"" + _v.ID + "\", pId: \"" + _v.ParentID + "\", name: \"" + _v.Name + "\" }";
            }

            return "[" + JSON + "]";
        }

        /// <summary>
        /// 添加应用程序
        /// </summary>
        /// <param name="FileName">文件夹名</param>
        /// <param name="FileParentID">上级文件夹ID</param>
        /// <param name="AppType">应用程序类型</param>
        /// <returns></returns>
        [WebMethod]
        public int CreateApp(string FileID, string FileName, string FileParentID,string AppType)
        {
            var v = db.OS_Files.Where(p => p.ID == new Guid(FileParentID));
            OS_Files model = new OS_Files();
            model.ID = new Guid(FileID);
            model.Name = FileName;
            model.ParentID = new Guid(FileParentID);
            model.ParentIDs =
                v.Count() > 0 ?
                (v.First().ParentIDs + FileParentID + "|") :
                ("|" + FileParentID + "|");
            model.Type = AppType;
            model.state = 1;
            model.ModifiedDate = model.CreatedDate = DateTime.Now;
            db.OS_Files.Add(model);
            return db.SaveChanges();
        }
    }
}
