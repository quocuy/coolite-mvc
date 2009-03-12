using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web.MVC;
using System.Linq.Dynamic;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class DataController : BaseDataController
    {
        //********************//
        //      Customer      //
        //********************//

        public AjaxStoreResult GetCustomer(int start, string filter)
        {
            if (!string.IsNullOrEmpty(filter))
            {
                var query = from c in this.DBContext.Customers 
                            where (c.CompanyName.ToLower().Contains(filter.ToLower()) || 
                                   c.CustomerID.ToLower().Contains(filter.ToLower())) 
                            select c;

                return new AjaxStoreResult(query.Skip(start).Take(1), query.Count());
            }
            return new AjaxStoreResult(this.DBContext.Customers.Skip(start).Take(1), this.DBContext.Customers.Count());
        }

        public AjaxStoreResult GetCustomersSimple(string filter)
        {
            var query = from c in this.DBContext.Customers
                        where (c.CompanyName.ToLower().StartsWith(filter.ToLower()) || 
                               c.CustomerID.ToLower().StartsWith(filter.ToLower()))
                        select new
                        {
                            c.CustomerID,
                            c.CompanyName,
                        };

            return new AjaxStoreResult(query);
        }

        public AjaxStoreResult GetCustomers(int limit, int start, string dir, string sort)
        {
            var query = from c in this.DBContext.Customers
                        orderby sort ascending
                        select new
                        {
                            c.CustomerID,
                            c.CompanyName,
                            c.ContactName,
                            c.Email,
                            c.Phone,
                            c.Fax,
                            c.Region
                        };

            if (dir.Equals("DESC"))
            {
                query = query.OrderByDescending(c => c.CompanyName);
            }

            int total = query.ToList().Count;

            query = query.Skip(start).Take(limit);
            return new AjaxStoreResult(query, total);
        }

        public AjaxStoreResult GetTopTenOrdersBySalesAmount()
        {
            return new AjaxStoreResult(this.DBContext.Top_Ten_Orders_By_Sales_Amounts);
        }


        //********************//
        //       Order        //
        //********************//

        public AjaxStoreResult GetOrder(int orderID)
        {
            if (orderID != -1)
            {
                var query = from o in this.DBContext.Orders
                            where o.OrderID.Equals(orderID)
                            select o;

                return new AjaxStoreResult(query.Take(1), query.Count());
            }
            return new AjaxStoreResult(this.DBContext.Orders.Take(1), this.DBContext.Orders.Count());
        }

        public AjaxStoreResult GetOrders(int limit, int start, string dir, string sort)
        {
            var query = from o in this.DBContext.Orders
                        orderby sort ascending
                        select new
                        {
                            o.OrderID,
                            o.OrderDate
                        };

            if (dir.Equals("DESC"))
            {
                query = query.OrderByDescending(o => o.OrderID);
            }

            int total = query.ToList().Count;

            query = query.Skip(start).Take(limit);

            return new AjaxStoreResult(query, total);
        }
    }
}