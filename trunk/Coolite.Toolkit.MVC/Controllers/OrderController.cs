using System.Web.Mvc;
using Coolite.Ext.Web.MVC;

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
