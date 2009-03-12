using System.Web.Mvc;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [Authorize]
    public class CustomerController : BaseDataController
    {
        public ActionResult TopTenOrdersBySalesAmount()
        {
            return this.View();
        }

        public ActionResult CustomerDetails()
        {
            return this.View();
        }

        public ActionResult CustomerList()
        {
            return this.View();
        }
    }
}
