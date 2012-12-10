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
    public class LookupController : ApiController
    {
        public IEnumerable<LookUp> Get(string id)
        {
            IEnumerable<LookUp> lookupData = null;
            //SupCompanyRepository supCompanyRepo = null;
            switch (id)
            {
                case "TransCode":
                    SupTransCodeRepository transCodeRepo = new SupTransCodeRepository();
                    lookupData = from transCode in transCodeRepo.GetAll().OrderBy(x => x.TransCode)
                                 select new LookUp(transCode.TransCode + GetDescriptionDetails(transCode.Description), transCode.TransCode);
                    break;
                case "TransSource":
                    SupTransSourceRepository transSourceRepo = new SupTransSourceRepository();
                    lookupData = from transSource in transSourceRepo.GetAll().OrderBy(x => x.TransSource)
                                 select new LookUp(transSource.TransSource.ToString() + GetDescriptionDetails(transSource.Description), transSource.TransSource.ToString());
                    break;
                case "PmtType":
                    SupPmtTypeRepository pmtTypeRepo = new SupPmtTypeRepository();
                    lookupData = from pmtType in pmtTypeRepo.GetAll().OrderBy(x => x.Payment_Type_ID_code)
                                 select new LookUp(pmtType.Payment_Type_ID_code.ToString() + GetDescriptionDetails(pmtType.Payment_Type_ID), pmtType.Payment_Type_ID_code.ToString());
                    break;
                case "Portfolio":
                    PortAcqRepository portfolioRepo = new PortAcqRepository();
                    lookupData = from port in portfolioRepo.GetAll().OrderBy(x => x.Portfolio_)
                                 select new LookUp(port.Portfolio_, port.Portfolio_);
                    break;
                case "Responsibility":
                    SupCompanyRepository respoRepo = new SupCompanyRepository();
                    lookupData = from respo in respoRepo.GetAll().OrderBy(x => x.Name)
                                 select new LookUp(respo.Agency + GetDescriptionDetails(respo.Name), respo.Agency);
                    break;
                case "Buyer":
                    SupCompanyRepository supCompanyRepo = new SupCompanyRepository();
                    lookupData = from buyer in supCompanyRepo.GetAll().OrderBy(x => x.Agency)
                                 select new LookUp(buyer.Name, buyer.Agency);
                    break;
                case "Seller":
                    supCompanyRepo = new SupCompanyRepository();
                    lookupData = from buyer in supCompanyRepo.GetAll().OrderBy(x => x.Name)
                                 select new LookUp(buyer.Name, buyer.Agency);
                    break;
                case "SupBrockettCompanies":
                    BockettCompanyRepository companyRepository = new BockettCompanyRepository();
                    lookupData = from company in companyRepository.GetAll().OrderBy(x => x.Id)
                                 select new LookUp(company.Company, company.Id.ToString());
                    break;
                case "Investor":
                    supCompanyRepo = new SupCompanyRepository();
                    lookupData = from investor in supCompanyRepo.GetAll().Where(record => record.Type == id).OrderBy(x => x.Agency)
                                 select new LookUp(investor.Name, investor.Agency);
                    break;
                default:
                    break;
            }
            return lookupData;
        }
        /// <summary>
        /// This is used to Add Decscription with the Text Property in DDL
        /// </summary>
        /// <param name="_descriptionText"></param>
        /// <returns></returns>
        public string GetDescriptionDetails(string _descriptionText)
        {
            if (!string.IsNullOrEmpty(_descriptionText))
            {
                //We have value
                return " | " + _descriptionText;
            }
            else
            {
                return "";
            }
        }
    }
}