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
    
    public partial class Sup_UploadDPS
    {
        public string PIMS_Account_Number { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string Tran_Code { get; set; }
        public Nullable<System.DateTime> Tran_Date { get; set; }
        public string Check_Number { get; set; }
        public Nullable<int> Payment_Type_ID { get; set; }
        public Nullable<int> Tran_Source { get; set; }
    }
}
