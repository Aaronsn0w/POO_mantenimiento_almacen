//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Almacen_DBFirst.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Productos
    {
        public long Id { get; set; }
        public string Codigo { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public Nullable<System.DateTime> FechaVencimiento { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string UDM { get; set; }
        public Nullable<decimal> Costo { get; set; }
        public Nullable<long> Existencia { get; set; }
        public string Estado { get; set; }
    }
}