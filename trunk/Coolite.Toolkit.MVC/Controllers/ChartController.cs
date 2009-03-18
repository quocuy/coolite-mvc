using System.Linq;
using System.Web.Mvc;
using System.Linq.Dynamic;
using Coolite.Toolkit.MVC.Models;

namespace Coolite.Toolkit.MVC.Controllers
{
    public class ChartController : BaseDataController
    {
        public ActionResult TotalByEmployee()
        {
            var query = (from e in this.DBContext.Employees
                        select new
                        {
                            EmployeeName = e.LastName + " " + e.FirstName,
                            Total = (from o in e.Orders
                                     join od in this.DBContext.Order_Details on o.OrderID equals od.OrderID
                                     select od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)
                                    ).Sum()
                        }).OrderBy("Total DESC");

            return View(query.ToList());
        }

        public ActionResult ProductSalesByCategory()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetProductsSalesByCategoryImage(int year)
        {
            var query = (from c in this.DBContext.Categories
                         select new
                         {
                             c.CategoryName,
                             Total = (from od in this.DBContext.Order_Details
                                      join p in c.Products on od.ProductID equals p.ProductID
                                      where od.Order.OrderDate.Value.Year == year || (year == 0)
                                      select od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)
                                     ).Sum()
                         }).OrderBy("Total DESC");
            ViewData["year"] = year;
            return View(query.ToList());
        }
    }
}
