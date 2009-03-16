using System.Web.Mvc;
using Coolite.Ext.Web.MVC;
using Coolite.Toolkit.MVC.Models;

namespace Coolite.Toolkit.MVC.Controllers
{
    [Authorize]
    public class OrderController : BaseDataController
    {
        public ActionResult OrderDetails()
        {
            return this.View();
        }

        public ActionResult OrderList()
        {
            return this.View();
        }
    }
}
