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
    }
}
