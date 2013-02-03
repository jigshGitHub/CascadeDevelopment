using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Cascade.Data.Models;
using Cascade.Data.Repositories;

namespace Cascade.Web.Controllers
{
    public class ComplianceController : ApiController
    {
        [HttpGet]
        public IEnumerable<MSI_Debtor> Debtors(string accountNumber)
        {
            IEnumerable<MSI_Debtor> debtors = null;

            try
            {
                DataQueries query = new DataQueries();
                debtors = query.GetDebtors(accountNumber);
            }
            catch (Exception ex)
            {
            }
            return debtors;
        }
    }
}
