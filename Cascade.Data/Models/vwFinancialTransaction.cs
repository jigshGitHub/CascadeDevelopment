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
    
    public partial class vwFinancialTransaction
    {
        public int Transaction_ID { get; set; }
        public string ACCOUNT { get; set; }
        public Nullable<System.DateTime> TRAN_DATE { get; set; }
        public string TRAN_CODE { get; set; }
        public string TRAN_SOURCE { get; set; }
        public Nullable<decimal> AMOUNT { get; set; }
        public Nullable<decimal> PRINCIPAL { get; set; }
        public Nullable<decimal> INTEREST { get; set; }
        public Nullable<decimal> COSTS { get; set; }
        public Nullable<decimal> OTHER { get; set; }
        public Nullable<decimal> COMMISSION { get; set; }
        public string RESPONSIBILITY { get; set; }
        public Nullable<System.DateTime> ORIG_TRAN_DATE { get; set; }
        public Nullable<System.DateTime> UPDATE_DATE { get; set; }
        public string ENTRY_ID { get; set; }
        public string ENTRY_TYPE { get; set; }
        public string IS_PAYMENT { get; set; }
        public string CREDIT_DEBIT { get; set; }
        public string DESCR { get; set; }
        public string IS_NSF { get; set; }
        public string IS_ADJUSTMENT { get; set; }
        public string IS_COST { get; set; }
        public string RREFERENCE { get; set; }
        public string PaymentType { get; set; }
        public string PaymentTypeID { get; set; }
        public string Portfolio { get; set; }
        public string STATUS { get; set; }
        public Nullable<int> YearsSinceLastActivity { get; set; }
        public Nullable<System.DateTime> PurchaseDate { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string NAME { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ADDRESS1 { get; set; }
        public string ADDRESS2 { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public string Zip { get; set; }
        public string ZIP_CODE { get; set; }
        public string SSN { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public Nullable<System.DateTime> DOD { get; set; }
        public string CoFirstName { get; set; }
        public string CoLastName { get; set; }
        public string CoAddress1 { get; set; }
        public string CoAddress2 { get; set; }
        public string CoCity { get; set; }
        public string CoState { get; set; }
        public string CoZip { get; set; }
        public string CoSSN { get; set; }
        public Nullable<System.DateTime> CoDOB { get; set; }
        public Nullable<System.DateTime> CoDOD { get; set; }
        public string Client { get; set; }
        public string ClientAccount { get; set; }
        public Nullable<System.DateTime> cLastPayDate { get; set; }
        public Nullable<decimal> cLastPayAmt { get; set; }
        public Nullable<decimal> CommissionRate { get; set; }
        public string InterestRate { get; set; }
        public Nullable<decimal> GrossPayment { get; set; }
        public Nullable<decimal> Fee { get; set; }
        public Nullable<decimal> NetPayment { get; set; }
        public string Seller { get; set; }
        public string SellerAccount { get; set; }
        public Nullable<System.DateTime> sLastPayDate { get; set; }
        public Nullable<decimal> sLastPayAmt { get; set; }
        public Nullable<int> InhouseScore { get; set; }
        public string WorkStatusDescription { get; set; }
        public string Originator { get; set; }
        public string OriginalAccount { get; set; }
        public Nullable<decimal> TOT_DUE_AMT { get; set; }
        public Nullable<decimal> TOT_PRIN_DUE { get; set; }
        public Nullable<decimal> TOT_INT_DUE { get; set; }
        public Nullable<decimal> TOT_COSTS_DUE { get; set; }
        public Nullable<decimal> TOT_OTHER_DUE { get; set; }
        public Nullable<decimal> OriginalBalance { get; set; }
        public Nullable<decimal> TOT_PTD { get; set; }
        public string PlacementFileID { get; set; }
        public Nullable<System.DateTime> DATE_SENT_AGENCY { get; set; }
        public Nullable<bool> WIP { get; set; }
        public Nullable<System.DateTime> WIPDate { get; set; }
        public Nullable<int> DaysSinceLastPay { get; set; }
        public Nullable<int> DaysSinceLastWorked { get; set; }
        public Nullable<int> DaysSinceLastUpdate { get; set; }
        public Nullable<int> DaysSinceLastStatus { get; set; }
        public Nullable<int> DaysSinceLastPlaced { get; set; }
        public Nullable<System.DateTime> ChargeOffDate { get; set; }
        public Nullable<System.DateTime> OpenDate { get; set; }
        public Nullable<decimal> oLastPayAmt { get; set; }
        public Nullable<System.DateTime> oLastPayDate { get; set; }
        public string User1 { get; set; }
        public string User2 { get; set; }
        public string User3 { get; set; }
        public string User4 { get; set; }
        public string User5 { get; set; }
        public string User7 { get; set; }
        public string User8 { get; set; }
        public string User10 { get; set; }
        public Nullable<int> PortfolioID { get; set; }
        public string EOriginalAccount { get; set; }
        public string PortfolioDesc { get; set; }
        public Nullable<decimal> NetAmount { get; set; }
        public string DIVISION_ID { get; set; }
        public string PortfolioName { get; set; }
        public string PortfolioOwner { get; set; }
        public string CompanyName { get; set; }
        public string User9 { get; set; }
        public string User6 { get; set; }
        public string CollectorCommission { get; set; }
        public string CNGStatus { get; set; }
        public string LoanNumber { get; set; }
        public Nullable<decimal> TotalPaid { get; set; }
        public string FLAGS { get; set; }
        public Nullable<System.DateTime> LAST_PAY_DATE { get; set; }
        public Nullable<decimal> LAST_PAY_AMT { get; set; }
        public Nullable<decimal> DueClient { get; set; }
        public Nullable<decimal> DueAgency { get; set; }
        public string TERRITORIES { get; set; }
        public Nullable<int> ProductTypeID { get; set; }
        public string TransactionPortfolio { get; set; }
        public Nullable<decimal> Recon { get; set; }
        public Nullable<System.DateTime> DepositDate { get; set; }
        public string DepositPeriod { get; set; }
        public string PostingPeriod { get; set; }
        public string TransactionPeriod { get; set; }
        public string TRAN_NOTE { get; set; }
        public string Batch { get; set; }
        public string BatchSequence { get; set; }
        public string BatchNumber { get; set; }
        public Nullable<decimal> CalculateCommission { get; set; }
        public Nullable<decimal> CalculateNetAmount { get; set; }
        public string PLACEMENT_CODE { get; set; }
    }
}