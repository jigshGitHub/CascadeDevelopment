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
    
    public partial class RSTATU
    {
        public RSTATU()
        {
            this.PortfolioStatusCrossRefs = new HashSet<PortfolioStatusCrossRef>();
            this.RACCOUNTs = new HashSet<RACCOUNT>();
        }
    
        public int StatusID { get; set; }
        public string STATUS { get; set; }
        public string DESCR { get; set; }
        public Nullable<int> StatusTypeID { get; set; }
        public string PLACEMENT_CODE { get; set; }
        public string LETTER_CODE { get; set; }
        public Nullable<bool> ACTIVE_YN { get; set; }
        public string UPDATE_ID { get; set; }
        public Nullable<System.DateTime> UPDATE_DATE { get; set; }
        public string PCode { get; set; }
        public Nullable<int> ChangeDays { get; set; }
        public Nullable<int> PcodeOnly { get; set; }
        public Nullable<int> WorkStatusID { get; set; }
        public Nullable<bool> Billable { get; set; }
        public string CBR_Status { get; set; }
        public string CBR_BKT_Status { get; set; }
        public string CBR_Special_Status { get; set; }
        public string CBR_Dispute_Status { get; set; }
    
        public virtual ICollection<PortfolioStatusCrossRef> PortfolioStatusCrossRefs { get; set; }
        public virtual ICollection<RACCOUNT> RACCOUNTs { get; set; }
    }
}
