using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.Web.Controllers;
using Cascade.Data.Repositories;
using Cascade.Data.Models;
namespace Cascade.Web.Areas.CRM.Controllers
{
    [Authorize]
    public class CompanyController : BaseController
    {
        //
        // GET: /CRM/Company/

        public ActionResult Index()
        {
            CompanyRepository compRepo = null;

            compRepo = new CompanyRepository();
            var prospects = compRepo.GetAll();

            return PartialView("Index", prospects);
        }

        //
        // GET: /CRM/Company/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /CRM/Company/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CRM/Company/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /CRM/Company/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /CRM/Company/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /CRM/Company/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /CRM/Company/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
