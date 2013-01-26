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
    
    public partial class MSI_vwRecallData
    {
        public int ID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public string OrigAcct_ { get; set; }
        public string AcctName { get; set; }
        public string Portfolio_ { get; set; }
        public string CurrentResp { get; set; }
        public string RecallReason { get; set; }
        public Nullable<System.DateTime> DateNoteSent { get; set; }
        public Nullable<System.DateTime> DateAcctClosed { get; set; }
        public string PIMSAcct_ { get; set; }
        public string NewStatus { get; set; }
        public string NewResp { get; set; }
        public Nullable<System.DateTime> Uploaded__y_n_ { get; set; }
        public string Check_ { get; set; }
        public string Inv_ { get; set; }
        public string Explanation { get; set; }
        public Nullable<decimal> FaceValueofAcct { get; set; }
        public Nullable<double> CostBasis { get; set; }
        public Nullable<double> SalesBasis { get; set; }
        public string RequestedBy { get; set; }
        public string SellerCheck_ { get; set; }
        public bool Putback { get; set; }
        public string Seller { get; set; }
        public Nullable<double> Expr1 { get; set; }
        public Nullable<double> Expr2 { get; set; }
    }
}
