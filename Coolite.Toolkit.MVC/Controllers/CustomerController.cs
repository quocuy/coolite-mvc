using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web.MVC;
using JsonResult=Coolite.Ext.Web.MVC.JsonResult;

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

        public StoreResult GetTopTenOrdersBySalesAmount()
        {
            return new StoreResult(this.DBContext.Top_Ten_Orders_By_Sales_Amounts);
        }

        public StoreResult GetCustomer(int start, string filter)
        {
            if(!string.IsNullOrEmpty(filter))
            {
                var query = from c in this.DBContext.Customers where c.CompanyName.StartsWith(filter) select c;
                return new StoreResult(query.Skip(start).Take(1), query.Count());
            }
            return new StoreResult(this.DBContext.Customers.Skip(start).Take(1), this.DBContext.Customers.Count());
        }
    }
}
