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
    public class MSIPortfolioEditedController : ApiController
    {
        public MSI_Port_Acq_Edited Get(string portfolioNumber)
        {
            MSI_Port_Acq_Edited portfolio = null;
            MSI_Port_Acq_EditedRepository repository = null;
            try
            {
                repository = new MSI_Port_Acq_EditedRepository();
                portfolio = repository.GetById(portfolioNumber);
                if (portfolio == null)
                {
                    MSI_Port_Acq_OriginalRepository originalRepository = new MSI_Port_Acq_OriginalRepository();
                    MSI_Port_Acq_Original originalPortfolio = originalRepository.GetById(portfolioNumber);
                    portfolio = new MSI_Port_Acq_Edited();
                    portfolio.C_ofAccts = originalPortfolio.C_ofAccts;
                    portfolio.ClosingDate = originalPortfolio.ClosingDate;
                    portfolio.Company = originalPortfolio.Company;
                    portfolio.CostBasis = originalPortfolio.CostBasis;
                    portfolio.Cut_OffDate = originalPortfolio.Cut_OffDate;
                    portfolio.Face = originalPortfolio.Face;
                    portfolio.Lender_FileDescription = originalPortfolio.Lender_FileDescription;
                    portfolio.Notes = originalPortfolio.Notes;
                    portfolio.Portfolio_ = originalPortfolio.Portfolio_;
                    portfolio.PurchasePrice = originalPortfolio.PurchasePrice;
                    portfolio.PutbackDeadline = originalPortfolio.PutbackDeadline;
                    portfolio.PutbackTerm__days_ = originalPortfolio.PutbackTerm__days_;
                    portfolio.ResaleRestrictionId = originalPortfolio.ResaleRestrictionId;
                    portfolio.Seller = originalPortfolio.Seller;
                }
            }
            catch (Exception ex)
            {
            }
            return portfolio;

        }
        public MSI_Port_Acq_Edited Post(MSI_Port_Acq_Edited inPortfolio)
        {
            MSI_Port_Acq_Edited portfolioToSave = null;
            MSI_Port_Acq_EditedRepository repository = null;
            bool editingRequired = true;
            try
            {

                repository = new MSI_Port_Acq_EditedRepository();
                portfolioToSave = repository.GetById(inPortfolio.Portfolio_);

                if (portfolioToSave == null)
                {
                    editingRequired = false;
                    portfolioToSave = new MSI_Port_Acq_Edited();
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