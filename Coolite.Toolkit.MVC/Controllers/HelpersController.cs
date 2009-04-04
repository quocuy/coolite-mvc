using System;
using System.Web.Mvc;
using Coolite.Ext.Web;
using Coolite.Ext.Web.MVC;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class HelpersController : Controller
    {
        public AjaxResult GetTimestamp()
        {
            JsonObject company = new JsonObject();

            company.Add("name", "Coolite");
            company.Add("country", "Canada");

            JsonObject customer = new JsonObject();

            customer.Add("name", "Geoff");
            customer.Add("email", "geoff@coolite.com");
            customer.Add("company", company);

            JsonObject obj = new JsonObject();

            obj.Add("date", DateTime.Now);
            obj.Add("day", DateTime.Now.ToString("dddd"));
            obj.Add("month", DateTime.Now.ToString("MMMM"));
            obj.Add("year", DateTime.Now.Year);
            obj.Add("leapyear", DateTime.IsLeapYear(DateTime.Now.Year));
            obj.Add("customer", customer);

            return new AjaxResult(obj);
        }

        //public AjaxResult GetThemeUrl(string theme)
        //{
        //    Theme temp = (Theme)Enum.Parse(typeof(Theme), theme);

        //    this.Session["Coolite.Theme"] = temp;

        //    return (temp == Theme.Default) ? "Default" : this.ScriptManager1.GetThemeUrl(temp);
        //}
    }
}
