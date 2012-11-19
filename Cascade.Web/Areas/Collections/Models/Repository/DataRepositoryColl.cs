using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JQueryDataTables.Models;
using Cascade.Web.Controllers;
using Cascade.Data.Repositories;
using Cascade.Data.Models;

namespace JQueryDataTables.Models.Repository
{
    /// <summary>
    /// Repository class - contains hardcoded data
    /// </summary>
    public class DataRepositoryColl
    {
        /// <summary>
        /// Method that returns all Portfolios used in this example
        /// </summary>
        /// <returns>List of Portfolios</returns>
        public static IList<TBL_Portfolio> GetPortfolios()
        {
            PortfolioRepository portRepo = null;
            portRepo = new PortfolioRepository();
            var portfolios = portRepo.GetAll().ToList();
            return portfolios;
        }
    }
}