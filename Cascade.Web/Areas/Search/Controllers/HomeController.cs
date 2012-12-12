﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cascade.Web.Controllers;
using Cascade.Data.Repositories;
using Cascade.Data.Models;
using MvcContrib.UI.Grid;
using Cascade.Web.Models;
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

        public ActionResult Basic(string basicSearchVal, GridSortOptions gridSortOptions, int? page)
        {
            var dataQueries = new DataQueries();
            IQueryable<SearchResult> results = dataQueries.GetSearchResults(basicSearchVal);
            //return PartialView("_BasicPartial", results);
            var pagedViewModel = new PagedViewModel<SearchResult>
            {
                ViewData = ViewData,
                Query = results,
                GridSortOptions = gridSortOptions,
                DefaultSortColumn = "ACCOUNT",
                Page = page,
                PageSize = 100,
            }
            .Setup();
            return View(pagedViewModel);
            //return PartialView("_BasicPartial",pagedViewModel);
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
