using System.Web.Mvc;
using Ext.Net.MVC.Models;

namespace Ext.Net.MVC.Controllers
{
    public abstract class BaseDataController : Controller
    {
        public BaseDataController()
        {
            this.db = new NorthwindDataContext();
        }

        NorthwindDataContext db;

        public NorthwindDataContext DBContext
        {
            get { return this.db; }
        }
    }
}
