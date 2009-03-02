using System;
using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web;
using Coolite.Utilities;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public void GetTimestamp()
        {
            string script = string.Concat("TextItem1.setText(", JSON.Serialize(DateTime.Now.ToString()), ")");
            new AjaxResponse(script).Return();
        }

        public ActionResult Index()
        {
            this.ViewData["Message"] = "Welcome to ASP.NET MVC!";

            NorthwindDataContext db = new NorthwindDataContext();

            var query = from p in db.Products 
                        where p.Category.CategoryName == "Beverages"
                        select p;

            return this.View();
        }

        public ActionResult About()
        {
            return this.View();
        }

        public ActionResult Form()
        {
            return this.View();
        }

        public void SaveForm(string action, string TextField1, string TextField2, string TextField3, string TextField4, string HtmlEditor1)
        {
            switch(action)
            {
                case "send":
                    CompressionUtils.GZipResponse("{success: true,errors:[{id:'0',msg:'Send is complete!!!'}]}");
                    break;
                case "error":
                    CompressionUtils.GZipResponse("{success: false,errors:[{id:'TextField4',msg:'Oops... Email incorrect!'}]}");
                    break;
                case "error1":
                    CompressionUtils.GZipResponse("{success: false,errors:[{id:'-',msg:'Oops... Internal server error!'}]}");
                    break;
            }
        }
    }
}
