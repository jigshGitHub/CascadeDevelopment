﻿using System.Web.Mvc;

namespace Cascade.Web.Areas.Portfolio
{
    public class PortfolioAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Portfolio";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Portfolio_default",
                "Portfolio/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Cascade.Web.Areas.Portfolio.Controllers" }
            );
        }
    }
}
