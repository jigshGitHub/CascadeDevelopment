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
    
    public partial class Port_Media
    {
        public int ID { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string CompanyRequesting { get; set; }
        public string Portfolio_ { get; set; }
        public string OriginalLender_Product { get; set; }
        public string OrigAcct_ { get; set; }
        public string SSN { get; set; }
        public string AcctName { get; set; }
        public bool Application { get; set; }
        public bool Affidavit_Issuer_ { get; set; }
        public bool Affidavit_Seller_ { get; set; }
        public Nullable<System.DateTime> StmtsFrom { get; set; }
        public Nullable<System.DateTime> StmtsTo { get; set; }
        public Nullable<System.DateTime> OpenDate { get; set; }
        public Nullable<System.DateTime> C_ODate { get; set; }
        public string Explanation { get; set; }
        public bool GMC_Manager_Approval__Y_or_N { get; set; }
        public string CompanySubmittedTo { get; set; }
        public Nullable<System.DateTime> DateSubmitted { get; set; }
        public Nullable<System.DateTime> DateConfirmed { get; set; }
        public Nullable<decimal> SellerFee { get; set; }
        public Nullable<System.DateTime> DateSellerPaid { get; set; }
        public Nullable<decimal> OurFee { get; set; }
        public Nullable<System.DateTime> DateReceived { get; set; }
        public Nullable<System.DateTime> DateForwarded { get; set; }
        public string TypeReceived { get; set; }
        public string OurInvtoBuyer { get; set; }
        public string OtherNotes_ { get; set; }
        public bool Unavailable { get; set; }
        public bool Closed { get; set; }
        public Nullable<System.DateTime> UnavailableDate { get; set; }
        public string SellerInv_ { get; set; }
        public Nullable<System.DateTime> DatePayRec { get; set; }
        public string BuyerCheck_ { get; set; }
        public string OurCheck_ { get; set; }
    }
}
