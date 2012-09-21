using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.UI.Controls;
using Cascade.Web.ApplicationIntegration;
namespace Cascade.Web.Controllers
{    
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            FillMenu();
            base.OnActionExecuting(filterContext);
        }

        private void FillMenu()
        {
            ViewData["Menu"] = (CascadeMenuCollection)MenuFactory.CurrentMenu.MenuCollection;
        }

    }
}
