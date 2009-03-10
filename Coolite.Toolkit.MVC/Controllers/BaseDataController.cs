using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Coolite.Toolkit.MVC.Controllers
{
    public abstract class BaseDataController : Controller
    {
        NorthwindDataContext db;

        public NorthwindDataContext DBContext
        {
            get { return this.db; }
        }

        public BaseDataController()
        {
            this.db = new NorthwindDataContext();
        }
    }
}
