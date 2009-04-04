using System.Collections.Generic;
using System.Web.Mvc;
using Coolite.Ext.Web;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            this.ViewData["AppName"] = "<b>Northwind Traders</b> (v0.8)";
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

        public AjaxFormResult SaveForm(string txtName, string txtEmail, string txtComments)
        {
            AjaxFormResult result = new AjaxFormResult();

            result.Success = true;

            result.ExtraParams["script"] = "Ext.Msg.alert('Success', 'Bug report sent');";
            
            return result;
        }
    }
}
