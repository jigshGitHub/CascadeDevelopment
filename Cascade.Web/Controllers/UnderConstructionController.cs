﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cascade.Web.Controllers
{
    public class UnderConstructionController : Controller
    {
        //
        // GET: /UnderConstruction/

        public ActionResult Index()
        {
            return PartialView("Index");
        }

        //
        // GET: /UnderConstruction/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /UnderConstruction/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /UnderConstruction/Create

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
        // GET: /UnderConstruction/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /UnderConstruction/Edit/5

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
        // GET: /UnderConstruction/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /UnderConstruction/Delete/5

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
