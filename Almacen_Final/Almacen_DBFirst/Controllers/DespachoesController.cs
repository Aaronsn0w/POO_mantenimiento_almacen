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
    public class DespachoesController : Controller
    {
        private AlmacenDBEntities db = new AlmacenDBEntities();

        // GET: Despachoes
        public ActionResult Index()
        {
            var despachos = db.Despachos.Include(d => d.Cliente);
            return View(despachos.ToList());
        }

        // GET: Despachoes/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Despacho despacho = db.Despachos.Find(id);
            if (despacho == null)
            {
                return HttpNotFound();
            }
            return View(despacho);
        }

        // GET: Despachoes/Create
        public ActionResult Create()
        {
            ViewBag.IdCliente = new SelectList(db.Clientes, "Id", "Codigo");
            return View();
        }

        // POST: Despachoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Fecha,TipoDeAccion,IdCliente,Contacto,DetalleDeProductos")] Despacho despacho)
        {
            if (ModelState.IsValid)
            {
                db.Despachos.Add(despacho);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdCliente = new SelectList(db.Clientes, "Id", "Codigo", despacho.IdCliente);
            return View(despacho);
        }

        // GET: Despachoes/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Despacho despacho = db.Despachos.Find(id);
            if (despacho == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdCliente = new SelectList(db.Clientes, "Id", "Codigo", despacho.IdCliente);
            return View(despacho);
        }

        // POST: Despachoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Fecha,TipoDeAccion,IdCliente,Contacto,DetalleDeProductos")] Despacho despacho)
        {
            if (ModelState.IsValid)
            {
                db.Entry(despacho).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdCliente = new SelectList(db.Clientes, "Id", "Codigo", despacho.IdCliente);
            return View(despacho);
        }

        // GET: Despachoes/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Despacho despacho = db.Despachos.Find(id);
            if (despacho == null)
            {
                return HttpNotFound();
            }
            return View(despacho);
        }

        // POST: Despachoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Despacho despacho = db.Despachos.Find(id);
            db.Despachos.Remove(despacho);
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
