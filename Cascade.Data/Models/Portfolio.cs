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
    
    public partial class Portfolio
    {
        public Portfolio()
        {
            this.RACCOUNTs = new HashSet<RACCOUNT>();
        }
    
        public int lngPortfolioID { get; set; }
        public string Description { get; set; }
        public Nullable<int> PortfolioTypeID { get; set; }
        public Nullable<System.DateTime> PurchaseDate { get; set; }
        public Nullable<int> PortfolioStatusID { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> Accounts { get; set; }
        public Nullable<decimal> Balance { get; set; }
        public Nullable<int> PaperAgeID { get; set; }
        public Nullable<int> PaperTypeID { get; set; }
        public Nullable<int> IndustryID { get; set; }
        public Nullable<int> SubIndustryID { get; set; }
        public string Notes { get; set; }
        public string Seller { get; set; }
        public string Client { get; set; }
        public string BidFile { get; set; }
        public string PurchaseFile { get; set; }
        public string ScoreFileName { get; set; }
        public string TableSourceName { get; set; }
        public string DataType { get; set; }
        public Nullable<int> ClientID { get; set; }
        public string Branch { get; set; }
        public string Portfolio1 { get; set; }
        public string Responsibility { get; set; }
        public string Status { get; set; }
        public string Office { get; set; }
        public Nullable<System.DateTime> SaleDate { get; set; }
        public Nullable<decimal> SalePrice { get; set; }
        public string SoldTo { get; set; }
        public string SoldToName { get; set; }
        public string SoldToPhone { get; set; }
        public string SaleFileName { get; set; }
        public string PreSaleFileName { get; set; }
        public Nullable<System.DateTime> PutbackDeadLine { get; set; }
        public Nullable<decimal> PurchasePrice { get; set; }
        public string User1 { get; set; }
        public string User2 { get; set; }
        public string User3 { get; set; }
        public string User4 { get; set; }
        public string User5 { get; set; }
        public string User6 { get; set; }
        public string User7 { get; set; }
        public string User8 { get; set; }
        public string User9 { get; set; }
        public string User10 { get; set; }
        public string User11 { get; set; }
        public string User12 { get; set; }
        public string User13 { get; set; }
        public string User14 { get; set; }
        public string User15 { get; set; }
        public string User16 { get; set; }
        public string User17 { get; set; }
        public string User18 { get; set; }
        public string User19 { get; set; }
        public string User20 { get; set; }
    
        public virtual PaperType PaperType { get; set; }
        public virtual ICollection<RACCOUNT> RACCOUNTs { get; set; }
    }
}
