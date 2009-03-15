using System;
using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web;
using Coolite.Utilities;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class HelpersController : Controller
    {
        public AjaxResult GetTimestamp()
        {
            string script = string.Concat("TextItem1.setText(", JSON.Serialize(DateTime.Now.ToString()), ")");
            return new AjaxResult(script);
        }

        //public AjaxResult GetThemeUrl(string theme)
        //{
        //    Theme temp = (Theme)Enum.Parse(typeof(Theme), theme);

        //    this.Session["Coolite.Theme"] = temp;

        //    return (temp == Theme.Default) ? "Default" : this.ScriptManager1.GetThemeUrl(temp);
        //}
    }
}
