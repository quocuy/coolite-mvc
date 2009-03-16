﻿using System.Collections.Generic;
using System.Web.Mvc;
using Coolite.Utilities;

namespace Coolite.Toolkit.MVC.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            this.ViewData["AppName"] = "<b>Northwind Traders</b>";
            this.ViewData["Username"] = this.HttpContext.User.Identity.Name;

            return this.View();
        }

        public ActionResult Dashboard()
        {
            List<string> items = new List<string>();
            
            items.Add("test");

            this.ViewData["Data"] = items;

            return this.View();
        }

        public ActionResult About()
        {
            return this.View();
        }

        public ActionResult Form()
        {
            return this.View();
        }

        public void SaveForm(string action, string TextField1, string TextField2, string TextField3, string TextField4, string HtmlEditor1)
        {
            switch(action)
            {
                case "send":
                    CompressionUtils.GZipResponse("{success: true,errors:[{id:'0',msg:'Send is complete!!!'}]}");
                    break;
                case "error":
                    CompressionUtils.GZipResponse("{success: false,errors:[{id:'TextField4',msg:'Oops... Email incorrect!'}]}");
                    break;
                case "error1":
                    CompressionUtils.GZipResponse("{success: false,errors:[{id:'-',msg:'Oops... Internal server error!'}]}");
                    break;
            }
        }
    }
}