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
    public class MSIPortfolioOriginalController : ApiController
    {
        public MSI_Port_Acq_Original Get(string portfolioNumber)
        {
            MSI_Port_Acq_Original portfolio = null;

            try
            {
                DataQueries query = new DataQueries();
                portfolio = query.GetPortfolioPurchaseSummary(portfolioNumber);
            }
            catch (Exception ex)
            {
            }
            return portfolio;

        }
        public MSI_Port_Acq_Original Post(MSI_Port_Acq_Original inPortfolio)
        {
            MSI_Port_Acq_Original portfolioToSave = null;
            MSI_Port_Acq_OriginalRepository repository = null;
            bool editingRequired = true;
            try
            {

                repository = new MSI_Port_Acq_OriginalRepository();
                portfolioToSave = repository.GetById(inPortfolio.Portfolio_);

                if (portfolioToSave == null)
                {
                    editingRequired = false;
                    portfolioToSave = new MSI_Port_Acq_Original();
                }
                portfolioToSave.Portfolio_ = inPortfolio.Portfolio_;
                portfolioToSave.Company = inPortfolio.Company;
                portfolioToSave.Cut_OffDate = inPortfolio.Cut_OffDate;
                portfolioToSave.ClosingDate = inPortfolio.ClosingDate;
                portfolioToSave.Lender_FileDescription = inPortfolio.Lender_FileDescription;
                portfolioToSave.Seller = inPortfolio.Seller;
                portfolioToSave.CostBasis = inPortfolio.CostBasis;
                portfolioToSave.Face = inPortfolio.Face;
                portfolioToSave.C_ofAccts = inPortfolio.C_ofAccts;
                portfolioToSave.PutbackDeadline = inPortfolio.PutbackDeadline;
                portfolioToSave.PutbackTerm__days_ = inPortfolio.PutbackTerm__days_;
                portfolioToSave.PurchasePrice = inPortfolio.PurchasePrice;
                portfolioToSave.ResaleRestrictionId = inPortfolio.ResaleRestrictionId;
                portfolioToSave.Notes = inPortfolio.Notes;
                if (editingRequired)
                    repository.Update(portfolioToSave);
                else
                    repository.Add(portfolioToSave);
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException validationException)
            {
                foreach (System.Data.Entity.Validation.DbEntityValidationResult errorResult in validationException.EntityValidationErrors)
                {
                    foreach (System.Data.Entity.Validation.DbValidationError error in errorResult.ValidationErrors)
                    {
                        string data = error.ErrorMessage;
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return portfolioToSave;
        }
    }

}