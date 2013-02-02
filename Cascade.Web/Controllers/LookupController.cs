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
            List<LookUp> data = new List<LookUp>();
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
                    DataQueries query = new DataQueries();
                    lookupData = query.GetDistinctProductCodes();

                    break;
                case "PortfolioOriginal":
                    MSI_Port_Acq_OriginalRepository repository = new MSI_Port_Acq_OriginalRepository();
                    lookupData = from port_acq in repository.GetAll()
                                 select new LookUp(port_acq.Portfolio_, port_acq.Portfolio_);

                    break;
                case "ResaleRestriction":
                    //data = new List<LookUp>();
                    //data.Add(new LookUp("No Approval Required", "1"));
                    //data.Add(new LookUp("Approval Required", "2"));
                    //data.Add(new LookUp("Notice Required", "3"));
                    //lookupData = data.AsEnumerable<LookUp>();
                    ReSaleRestrictionRepository resaleRepo = new ReSaleRestrictionRepository();
                    lookupData = from reSale in resaleRepo.GetAll()
                                 select new LookUp(reSale.Restriction, reSale.Value.ToString());
                    break;
                case "PutbackTerm":
                    data = new List<LookUp>();
                    data.Add(new LookUp("90", "90"));
                    data.Add(new LookUp("120", "120"));
                    data.Add(new LookUp("180", "180"));
                    lookupData = data.AsEnumerable<LookUp>();
                    break;
                case "Responsibility":
                    SupCompanyRepository respoRepo = new SupCompanyRepository();
                    lookupData = from respo in respoRepo.GetAll().OrderBy(x => x.Name)
                                 select new LookUp(respo.Agency + GetDescriptionDetails(respo.Name), respo.Agency);
                    break;
                case "Buyer":
                    SupCompanyRepository supCompanyRepo = new SupCompanyRepository();
                    //lookupData = from buyer in supCompanyRepo.GetAll().OrderBy(x => x.Agency)
                    //             select new LookUp(buyer.Name, buyer.Agency);
                    query = new DataQueries();
                    lookupData = query.GetDistinctResponsibility();
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
                case "RProdCode":
                    RProductCodeRepository rprodCodeRepo = new RProductCodeRepository();
                    lookupData = from prodCode in rprodCodeRepo.GetAll().OrderBy(x => x.PRODUCT_CODE)
                                 select new LookUp(prodCode.PRODUCT_CODE + GetDescriptionDetails(prodCode.PortfolioOwner), prodCode.ProductID.ToString());
                    break;
                case "RTranCode":
                    RTranCodeRepository rtranCodeRepo = new RTranCodeRepository();
                    lookupData = from tranCode in rtranCodeRepo.GetAll().OrderBy(x => x.TRAN_CODE)
                                 select new LookUp(tranCode.TRAN_CODE + GetDescriptionDetails(tranCode.DESCR), tranCode.TRAN_CODE);
                    break;
                case "Status":
                    SupStatusRepository supStatusRepo = new SupStatusRepository();
                    lookupData = from status in supStatusRepo.GetAll().OrderBy(x => x.WorkGroup)
                                 select new LookUp(status.Status + GetDescriptionDetails(status.WorkGroup), status.Status);
                    break;
                case "Reason":
                    SupReasonRepository supReasonRepo = new SupReasonRepository();
                    lookupData = from reason in supReasonRepo.GetAll().OrderBy(x => x.Reason)
                                 select new LookUp(reason.Reason, reason.Reason);
                    break;

                case "MoneySource":
                    SourceDataRepository sourceRepo = new SourceDataRepository();
                    lookupData = from source in sourceRepo.GetAll().OrderBy(x => x.SText)
                                 select new LookUp(source.SText, source.SID.ToString());
                    break;

                case "People":
                    PeopleDataRepository peopleRepo = new PeopleDataRepository();
                    lookupData = from people in peopleRepo.GetAll().OrderBy(x => x.FName)
                                 select new LookUp(people.FName + " " +  people.LName, people.PID.ToString());
                    break;
                //People


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
        public class Product_CodeDistinct : IEqualityComparer<RACCOUNT>
        {

            #region IEqualityComparer<Task> Members

            public bool Equals(RACCOUNT x, RACCOUNT y)
            {
                return x.PRODUCT_CODE == y.PRODUCT_CODE;
            }

            public int GetHashCode(RACCOUNT obj)
            {
                return obj.PRODUCT_CODE.GetHashCode();
            }

            #endregion
        }
    }
}