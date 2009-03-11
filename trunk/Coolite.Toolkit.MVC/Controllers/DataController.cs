using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web;
using Coolite.Utilities;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class DataController : Controller
    {
        NorthwindDataContext db;

        public DataController()
        {
            db = new NorthwindDataContext();
        }

        public void GetCustomers(int limit, int start, string dir, string sort)
        {
            var query = from c in this.db.Customers
                        orderby sort ascending
                        select new
                        {
                            c.CustomerID,
                            c.CompanyName,
                            c.ContactName
                            //c.ContactTitle,
                            //c.Address,
                            //c.City,
                            //c.Region,
                            //c.PostalCode,
                            //c.Country,
                            //c.Phone,
                            //c.Fax
                        };

            if (dir.Equals("DESC"))
            {
                query = query.OrderByDescending(c => c.CompanyName);
            }

            int totalRecords = query.ToList().Count;

            query = query.Skip(start).Take(limit);
            string script = JSON.Serialize(query);

            StoreResponseData sr = new StoreResponseData();
            sr.TotalCount = totalRecords;
            sr.Data = script;
            sr.Return();
        }
    }
}