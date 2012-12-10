using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.Web.Controllers;
using Cascade.Data.Models;
using Cascade.Data.Repositories;
using Cascade.Web.Areas.Collections.Models;

namespace Cascade.Web.Areas.Reports.Controllers
{
    public class HomeController : BaseController
    {
        //
        // GET: /Reports/Home/

        public ActionResult Index(string id)
        {
            //ViewData["reportType"] = id;
            //Save the Report Type in ViewBag. It will be stored in the Hidden field on the Page
            ViewBag.ReportType = id;
            return View();
        }

        public JsonResult GetDPSData(int recordid)
        {
            PortDPSRepository portDPSRepo = new PortDPSRepository();
            var _portDPSData = from _portDPS in portDPSRepo.GetAll().Distinct()
                               where _portDPS.ID == recordid 
                               select _portDPS;
            //return _dpsform;
            return  Json(_portDPSData.SingleOrDefault(), JsonRequestBehavior.AllowGet);

        }

        public ViewResult Edit(string recordid)
        {
            ViewBag.RecordId = recordid;
            //return the view
            return View();
        }

        [HttpPost]
        public JsonResult EditDPSData(Form _dpsform)
        {
            PortDPSRepository repository;
            Port_DPS dpsToSave;
            try
            {
                repository = new PortDPSRepository();
                if (_dpsform.ID > 0)
                {
                    //Edit Operation
                    dpsToSave = new Port_DPS();
                    Mappings.ViewModelToModelWithId(dpsToSave, _dpsform);
                    repository.Update(dpsToSave);
                }
            }
            catch (Exception ex)
            {
            }
            //return _dpsform;
            return Json(_dpsform, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetReportData(DateTime? StartDate, DateTime? EndDate, int? Company, string ToRange, string FromRange, string ReportType)
        {
            //Get Bockett Company Repository
            if (Company == null)
            {
                //We are just setting it up// This report does not require Company 
                Company = 1;
            }
            BockettCompanyRepository bockettCompRepo = new BockettCompanyRepository();
            //Find out Company Name
            var _companyName = bockettCompRepo.GetAll().Where(x => x.Id == Company).SingleOrDefault().Company;
            //For Report based on Report Type selection
            switch (ReportType)
            {
                case "CashFlow":
                    //Get the View Repository
                    PortCashFlowRepository portCashFlowRepo = new PortCashFlowRepository();
                    //Get the Report Data
                    var _cashFlowreportData = from cashFlow in portCashFlowRepo.GetAll().Distinct()
                                              where cashFlow.Company == _companyName 
                                              && cashFlow.ClosingDate >= StartDate 
                                              && cashFlow.ClosingDate <= EndDate
                                              select cashFlow;
                    //return the data
                    return PartialView("_portfolioCashFlow", _cashFlowreportData.ToList());

                case "CashPosition":
                    //Get the View Repository
                    //PortCashPositionRepository portCashPositionRepo = new PortCashPositionRepository();
                    ////Get the Report Data
                    //var _cashPositionreportData = portCashPositionRepo.GetAll().Distinct().Where(p => p.Company == _companyName);
                    //return PartialView("_portfolioCashPosition", _cashPositionreportData.ToList());

                case "Purchases":
                    //Get the View Repository
                    PortAcqRepository portAcqRepo = new PortAcqRepository();
                    //Get the Report Data
                    var _purchasesData = portAcqRepo.GetAll().Distinct().Where(p => p.ClosingDate >= StartDate && p.ClosingDate <= EndDate);
                    return PartialView("_purchases", _purchasesData.ToList());

                case "Sales":
                    //Get the View Repository
                    PortTransRepository portTransRepo = new PortTransRepository();
                    //Get the Report Data
                    var _salesData = portTransRepo.GetAll().Distinct().Where(p => p.TransType == "Sale" && (p.ClosingDate >= StartDate && p.ClosingDate <= EndDate));
                    return PartialView("_sales", _salesData.ToList());
                     
                case "CollectionsRecon":
                    //Get the View Repository
                    //CollectionsReconRepository collectionsReconRepo = new CollectionsReconRepository();
                    ////Get the Report Data
                    //var _collectionsReconData = from collectionRecon in collectionsReconRepo.GetAll().Distinct()
                    //                            where collectionRecon.Company == _companyName
                    //                          && collectionRecon.ClosingDate >= StartDate
                    //                          && collectionRecon.ClosingDate <= EndDate
                    //                            select collectionRecon;
                    ////return the data
                    //return PartialView("_collectionsRecon", _collectionsReconData.ToList());

                //case "PortfolioSummary":
                //    //Get the View Repository
                //    PortfolioSummaryRepository portSummaryRepo = new PortfolioSummaryRepository();
                //    //Get the Report Data
                //    var _portSummaryData = from portSummary in portSummaryRepo.GetAll().Distinct()
                //                           where portSummary.Company == _companyName
                //                           select portSummary;
                //    //return the data
                //    return PartialView("_portfolioSummary", _portSummaryData.ToList());

                //case "PortTransactions":
                //    //Get the View Repository
                //    PortfolioTransactionsRepository portTransactionsRepo = new PortfolioTransactionsRepository();
                //    //Get the Report Data
                //    var _portTransactionsData = from portTransaction in portTransactionsRepo.GetAll().Distinct()
                //                                where portTransaction.Company == _companyName
                //                                select portTransaction;
                //    //return the data
                //    return PartialView("_portfolioTransactions", _portTransactionsData.ToList());


                //case "AddDPSCheck":
                //    //Get the View Repository
                //    AddDPSCheckRepository portDPSRepo = new AddDPSCheckRepository();
                //    //Get the Report Data
                //    var _portDPSAddCheckData = from addCheckData in portDPSRepo.GetAll().Distinct()
                //                               where addCheckData.Company == _companyName
                //                               select addCheckData;
                //    //return the data
                //    return PartialView("_portDPSAddCheck", _portDPSAddCheckData.ToList());

                

                default:
                    return PartialView();
            }
        }



        


    }
}
