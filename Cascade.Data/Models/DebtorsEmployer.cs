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
    
    public partial class DebtorsEmployer
    {
        public string Division_ID { get; set; }
        public string Account { get; set; }
        public string Employer { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public Nullable<System.DateTime> DOH { get; set; }
        public Nullable<System.DateTime> DOF { get; set; }
        public string Title { get; set; }
        public string Department { get; set; }
        public string Supervisor { get; set; }
        public string SupervisorPhone { get; set; }
        public string Income { get; set; }
        public string Shift { get; set; }
        public string MonthsSinceHire { get; set; }
        public string IncomeHolder { get; set; }
        public string IncomeType { get; set; }
        public string GrossPay { get; set; }
        public string Day_Of_Week { get; set; }
        public string Direct_Deposit { get; set; }
        public Nullable<System.DateTime> Next_Pay_Date { get; set; }
        public string Pay_Frequency { get; set; }
        public Nullable<System.DateTime> Est_Next_Pay_Date { get; set; }
        public string CorporateAddress1 { get; set; }
        public string CorporateAddress2 { get; set; }
        public string CorporateCity { get; set; }
        public string CorporateState { get; set; }
        public string CorporateZip { get; set; }
        public string CorporatePhone { get; set; }
        public string CorporateFax { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> Update_Date { get; set; }
        public string Update_ID { get; set; }
        public string Update_Type { get; set; }
        public Nullable<System.DateTime> Last_Pay_Date { get; set; }
        public Nullable<bool> Employeed { get; set; }
        public Nullable<bool> Verified { get; set; }
        public Nullable<System.DateTime> DateVerified { get; set; }
    
        public virtual RACCOUNT RACCOUNT { get; set; }
    }
}
