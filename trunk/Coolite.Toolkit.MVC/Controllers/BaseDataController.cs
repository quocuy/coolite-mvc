using System.Web.Mvc;
using Coolite.Toolkit.MVC.Models;

namespace Coolite.Toolkit.MVC.Controllers
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
