using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.Web.Controllers;
using Cascade.Data.Repositories;
using Cascade.Data.Models;
namespace Cascade.Web.Areas.Search.Controllers
{
    public class HomeController : BaseController
    {
        //
        // GET: /Search/Home/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Search/Home/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Search/Home/Create

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult Basic(string name, string parameter2)
        {
            var dataQueries = new DataQueries();
            IEnumerable<SearchResult> results = dataQueries.GetSearchResults(name);
            return PartialView("_BasicPartial", results);
        }
        //
        // POST: /Search/Home/Create

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
        // GET: /Search/Home/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Search/Home/Edit/5

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
        // GET: /Search/Home/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Search/Home/Delete/5

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
