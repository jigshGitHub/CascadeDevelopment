﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.Web.Controllers;
namespace Cascade.Web.Areas.Compliance.Controllers
{
    public class HomeController : BaseController
    {
        //
        // GET: /Compliance/Home/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Compliance/Home/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Compliance/Home/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Compliance/Home/Create

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
        // GET: /Compliance/Home/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Compliance/Home/Edit/5

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
        // GET: /Compliance/Home/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Compliance/Home/Delete/5

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
