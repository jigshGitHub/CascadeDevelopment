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
    
    public partial class RFINTRAN
    {
        public int Transaction_ID { get; set; }
        public string DIVISION_ID { get; set; }
        public string ACCOUNT { get; set; }
        public Nullable<System.DateTime> TRAN_DATE { get; set; }
        public Nullable<decimal> TRAN_SEQ { get; set; }
        public string TRAN_CODE { get; set; }
        public string TRAN_SOURCE { get; set; }
        public string RREFERENCE { get; set; }
        public Nullable<decimal> AMOUNT { get; set; }
        public Nullable<decimal> PRINCIPAL { get; set; }
        public Nullable<decimal> INTEREST { get; set; }
        public Nullable<decimal> COSTS { get; set; }
        public Nullable<decimal> OTHER { get; set; }
        public Nullable<decimal> COMMISSION { get; set; }
        public string DUE_AGENCY { get; set; }
        public string RESPONSIBILITY { get; set; }
        public string RESP_TYPE { get; set; }
        public Nullable<System.DateTime> ORIG_TRAN_DATE { get; set; }
        public Nullable<System.DateTime> UPDATE_DATE { get; set; }
        public string ALLOCATION_CODE { get; set; }
        public string ENTRY_ID { get; set; }
        public string ENTRY_TYPE { get; set; }
        public string CheckNumber { get; set; }
        public Nullable<int> PaymentTypeID { get; set; }
        public string PrintStatement { get; set; }
        public string Comment { get; set; }
        public decimal Balance { get; set; }
        public string ReturnCode { get; set; }
        public string Portfolio { get; set; }
        public Nullable<int> ClientID { get; set; }
        public Nullable<decimal> CollectorCommission { get; set; }
        public Nullable<decimal> Fee { get; set; }
        public Nullable<decimal> PaymentAmount { get; set; }
        public string PaymentID { get; set; }
        public Nullable<bool> ExportDirectPayment { get; set; }
        public Nullable<System.DateTime> ExportDirectPaymentDate { get; set; }
        public string Memo { get; set; }
        public Nullable<decimal> Recon { get; set; }
        public Nullable<System.DateTime> DepositDate { get; set; }
    
        public virtual RACCOUNT RACCOUNT { get; set; }
        public virtual RTRANCDE RTRANCDE { get; set; }
    }
}
