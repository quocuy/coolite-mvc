using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [Authorize]
    public class CustomerController : BaseDataController
    {
        public ActionResult TopTenOrdersBySalesAmount2()
        {
            return this.View();
        }

        public StoreResult GetTopTenOrdersBySalesAmount()
        {
            return new StoreResult(this.DBContext.Top_Ten_Orders_By_Sales_Amounts.ToList());
        }
    }
}
