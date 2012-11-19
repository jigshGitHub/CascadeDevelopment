using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.Web.Controllers;
using Cascade.Data.Repositories;
using Cascade.Data.Models;
using JQueryDataTables.Models.Repository;

namespace Cascade.Web.Areas.Collections.Controllers
{
    public class DPSController : BaseController
    {
        //
        // GET: /Collections/DPS/

        public ActionResult Index()
        {
            return View();
        }
        //Get State List
        public JsonResult GetStateList()   
        {
            var allStates = from state in DataRepositoryColl.GetStates()
                            select new { Text = state.Name, Value = state.Id };
            //return Json
            return Json(allStates.ToList(), JsonRequestBehavior.AllowGet);
                        
        }
        //Get Trans Codes List
        public JsonResult GetTransCodeList()
        {
            var alltransCodes = from transCode in DataRepositoryColl.GetTransCodes()
                                select new { Text = transCode.TransCode, Value = transCode.TransCode };
            //return Json
            return Json(alltransCodes.ToList(), JsonRequestBehavior.AllowGet);

        }
        //Get Trans Sources List
        public JsonResult GetTransSourceList()
        {
            var alltransSources = from transSource in DataRepositoryColl.GetTransSources()
                                  select new { Text = transSource.TransSource, Value = transSource.TransSource };
            //return Json
            return Json(alltransSources.ToList(), JsonRequestBehavior.AllowGet);

        }
        //Get Pmt Types List
        public JsonResult GetPmtTypesList()
        {
            var allpmtTypes = from pmtType in DataRepositoryColl.GetPmtTypes()
                              select new { Text = pmtType.Payment_Type_ID_code, Value = pmtType.Payment_Type_ID_code };
            //return Json
            return Json(allpmtTypes.ToList(), JsonRequestBehavior.AllowGet);

        }
        //Get Portfolios
        public JsonResult GetPortfoliosList()
        {
            var portfolios = from portfolio in DataRepositoryColl.GetAllPortfolios()
                             select new { Text = portfolio.Portfolio_  , Value = portfolio.Lender_FileDescription };
            //return Json
            return Json(portfolios.ToList(), JsonRequestBehavior.AllowGet);

        }
        //Get Responsibilities
        public JsonResult GetResponsibilitesList()
        {
            var responsibilities = from respo in DataRepositoryColl.GetResponsibilities()
                                   select new { Text = respo.Agency, Value = respo.Name };
            //return Json
            return Json(responsibilities.ToList(), JsonRequestBehavior.AllowGet);

        }

    }
}
