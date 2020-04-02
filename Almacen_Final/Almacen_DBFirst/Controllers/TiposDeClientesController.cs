using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Almacen_DBFirst.Models;

namespace Almacen_DBFirst.Controllers
{
    public class TiposDeClientesController : Controller
    {
        private AlmacenDatabaseEntities db = new AlmacenDatabaseEntities();

        // GET: TiposDeClientes
        public ActionResult Index()
        {
            return View(db.TiposDeClientes.ToList());
        }

        // GET: TiposDeClientes/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TiposDeClientes tiposDeClientes = db.TiposDeClientes.Find(id);
            if (tiposDeClientes == null)
            {
                return HttpNotFound();
            }
            return View(tiposDeClientes);
        }

        // GET: TiposDeClientes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TiposDeClientes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Nombre")] TiposDeClientes tiposDeClientes)
        {
            if (ModelState.IsValid)
            {
                db.TiposDeClientes.Add(tiposDeClientes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tiposDeClientes);
        }

        // GET: TiposDeClientes/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TiposDeClientes tiposDeClientes = db.TiposDeClientes.Find(id);
            if (tiposDeClientes == null)
            {
                return HttpNotFound();
            }
            return View(tiposDeClientes);
        }

        // POST: TiposDeClientes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre")] TiposDeClientes tiposDeClientes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tiposDeClientes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tiposDeClientes);
        }

        // GET: TiposDeClientes/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TiposDeClientes tiposDeClientes = db.TiposDeClientes.Find(id);
            if (tiposDeClientes == null)
            {
                return HttpNotFound();
            }
            return View(tiposDeClientes);
        }

        // POST: TiposDeClientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            TiposDeClientes tiposDeClientes = db.TiposDeClientes.Find(id);
            db.TiposDeClientes.Remove(tiposDeClientes);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
