using System;
using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web;

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
    }
}
