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
    
    public partial class RACTPLAC
    {
        public decimal PLACEMENTID { get; set; }
        public string DIVISION_ID { get; set; }
        public string ACCOUNT { get; set; }
        public System.DateTime PLACEMENT_DATE { get; set; }
        public string RESPONSIBILITY { get; set; }
        public string PLACED_BY_ID { get; set; }
        public Nullable<decimal> AMT_PLACED { get; set; }
        public Nullable<System.DateTime> RETURN_DATE { get; set; }
        public Nullable<decimal> AMT_RETURNED { get; set; }
        public string REASON_RETURNED { get; set; }
        public string Stage { get; set; }
        public decimal COLLECTED { get; set; }
    
        public virtual RACCOUNT RACCOUNT { get; set; }
    }
}