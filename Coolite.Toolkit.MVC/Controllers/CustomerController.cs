using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Coolite.Ext.Web;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [Authorize]
    public class CustomerController : BaseDataController
    {
        public ActionResult TopTenOrdersBySalesAmount()
        {
            return View();
        }

        public StoreResult GetTopTenOrdersBySalesAmount()
        {
            return new StoreResult(this.DBContext.Top_Ten_Orders_By_Sales_Amounts.ToList());
        }
    }
}
