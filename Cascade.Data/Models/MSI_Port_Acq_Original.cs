//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cascade.Data.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class MSI_Port_Acq_Original
    {
        public string Portfolio_ { get; set; }
        public Nullable<System.DateTime> Cut_OffDate { get; set; }
        public Nullable<System.DateTime> ClosingDate { get; set; }
        public string Lender_FileDescription { get; set; }
        public string Seller { get; set; }
        public Nullable<double> CostBasis { get; set; }
        public Nullable<decimal> Face { get; set; }
        public Nullable<decimal> PurchasePrice { get; set; }
        public Nullable<double> C_ofAccts { get; set; }
        public Nullable<int> PutbackTerm__days_ { get; set; }
        public Nullable<System.DateTime> PutbackDeadline { get; set; }
        public string Notes { get; set; }
        public Nullable<int> ResaleRestrictionId { get; set; }
        public string Company { get; set; }
    }
}
