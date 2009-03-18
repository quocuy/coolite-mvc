using System.Collections.Generic;
using System.Web.Mvc;
using Coolite.Utilities;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            this.ViewData["AppName"] = "<b>Northwind Traders</b>";
            this.ViewData["Username"] = this.HttpContext.User.Identity.Name;

            return this.View();
        }

        public ActionResult Dashboard()
        {
            List<string> items = new List<string>();
            
            items.Add("test");

            this.ViewData["Data"] = items;

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

        public AjaxResult SaveForm(string txtName, string txtEmail, string txtComments)
        {
            AjaxResult result = new AjaxResult();

            result.Script = "Ext.Msg.alert('Success', 'Bug report sent');";

            return result;

            //CompressionUtils.GZipResponse("{success: true, errors:[{id:'0',msg:'Send is complete!!!'}]}");
        }
    }
}
