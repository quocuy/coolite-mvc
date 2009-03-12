using System;
using System.Linq;
using System.Web.Mvc;
using Coolite.Ext.Web.MVC;
using System.Linq.Dynamic;
using Coolite.Toolkit.MVC.Models;

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
            var query = (from c in this.DBContext.Customers
                        select new
                        {
                            c.CustomerID,
                            c.CompanyName,
                            c.ContactName,
                            c.Email,
                            c.Phone,
                            c.Fax,
                            c.Region
                        }).OrderBy(string.Concat(sort, " ", dir));

            int total = query.ToList().Count;

            query = query.Skip(start).Take(limit);
            return new AjaxStoreResult(query, total);
        }

        public AjaxStoreResult GetTopTenOrdersBySalesAmount()
        {
            return new AjaxStoreResult(this.DBContext.Top_Ten_Orders_By_Sales_Amounts);
        }

        public AjaxResult DeleteCustomer(string id)
        {
            AjaxResult response = new AjaxResult();
            try
            {
                
                var customer = (from c in this.DBContext.Customers where c.CustomerID == id select c).First();
                this.DBContext.Customers.DeleteOnSubmit(customer);
                this.DBContext.SubmitChanges();
            }
            catch (Exception e)
            {
                response.ErrorMessage = e.ToString();
            }
            return response;
        }

        public AjaxFormResult SaveCustomer(string id, FormCollection values)
        {
            AjaxFormResult response = new AjaxFormResult();

            try
            {
                //for example
                if(string.IsNullOrEmpty(values["Notes"]))
                {
                    response.Success = false;
                    response.Errors.Add(new FieldError("Notes", "The Notes field is required"));
                    return response;
                }

                bool isNew = false;

                Customer customer;
                if(string.IsNullOrEmpty(id))
                {
                    customer = new Customer();
                    customer.CustomerID = Guid.NewGuid().ToString().GetHashCode().ToString();
                    isNew = true;
                }
                else
                {
                    customer = (from c in this.DBContext.Customers where c.CustomerID == id select c).First();
                }
                
                
                customer.CompanyName = values["CompanyName"];
                customer.Address = values["Address"];
                customer.City = values["City"];
                customer.ContactName = values["ContactName"];
                customer.ContactTitle = values["ContactTitle"];
                customer.Country = values["Country"];
                customer.Email = values["Email"];
                customer.Fax = values["Fax"];
                customer.Mobile = values["Mobile"];
                customer.Notes = values["Notes"];
                customer.Phone = values["Phone"];
                customer.PostalCode = values["PostalCode"];
                customer.Region = values["Region"];
                customer.WebPage = values["WebPage"];

                if(isNew)
                {
                    this.DBContext.Customers.InsertOnSubmit(customer);
                }

                this.DBContext.SubmitChanges();

                response.ExtraParams["newID"] = customer.CustomerID;
            }
            catch (Exception e)
            {
                response.Success = false;
                response.ExtraParams["msg"] = e.ToString();
            }

            return response;
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
            var query = (from o in this.DBContext.Orders
                        select new
                        {
                            o.OrderID,
                            o.OrderDate
                        }).OrderBy(string.Concat(sort, " ", dir));

            int total = query.ToList().Count;

            query = query.Skip(start).Take(limit);

            return new AjaxStoreResult(query, total);
        }
    }
}