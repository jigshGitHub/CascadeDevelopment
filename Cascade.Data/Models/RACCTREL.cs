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
    
    public partial class RACCTREL
    {
        public string DIVISION_ID { get; set; }
        public string ACCOUNT { get; set; }
        public string REL_TYPE { get; set; }
        public string REL_POS { get; set; }
        public string P_A_ADDR_FLAG { get; set; }
        public string NAME { get; set; }
        public string SALUTATION { get; set; }
        public string PREFIX { get; set; }
        public string FIRSTNAME { get; set; }
        public string MIDDLENAME { get; set; }
        public string LASTNAME { get; set; }
        public string SUFFIX { get; set; }
        public string GENDER { get; set; }
        public string ADDRESS1 { get; set; }
        public string ADDRESS2 { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public string ZIP_CODE { get; set; }
        public string ZIP4 { get; set; }
        public string COUNTY { get; set; }
        public string COUNTRY { get; set; }
        public string SS_NO { get; set; }
        public string PHONE_HOME { get; set; }
        public string PHONE_WORK { get; set; }
        public string PHONE_OTHER { get; set; }
        public string PHONE_CELL { get; set; }
        public string WorkExt { get; set; }
        public string Email { get; set; }
        public string DRIV_LIC_NO { get; set; }
        public string TIME_ZONE { get; set; }
        public string COMMNT { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public Nullable<System.DateTime> DOD { get; set; }
        public Nullable<System.DateTime> UPDATE_DATE { get; set; }
        public string UPDATE_TYPE { get; set; }
        public string UPDATE_ID { get; set; }
        public string DLState { get; set; }
        public string DeathCertificate { get; set; }
        public string FuneralHome { get; set; }
        public string CityOD { get; set; }
        public string CountyOD { get; set; }
        public string StateOD { get; set; }
        public string ContactName { get; set; }
        public string ContactTelephone { get; set; }
        public Nullable<int> Phone_Home_StatusID { get; set; }
        public int Phone_Work_StatusID { get; set; }
        public Nullable<int> Phone_Other_StatusID { get; set; }
        public Nullable<int> Phone_Cell_StatusID { get; set; }
        public string bad_addr_flag { get; set; }
        public string Last_Call_Result_Home { get; set; }
        public string Last_Call_Result_Work { get; set; }
        public string Last_Call_Result_Cell { get; set; }
        public string Last_Call_Result_Other { get; set; }
        public string Last_Call_Desc_Home { get; set; }
        public string Last_Call_Desc_Work { get; set; }
        public string Last_Call_Desc_Cell { get; set; }
        public string Last_Call_Desc_Other { get; set; }
        public string Last_Call_Number_Home { get; set; }
        public string Last_Call_Number_Work { get; set; }
        public string Last_Call_Number_Cell { get; set; }
        public string Last_Call_Number_Other { get; set; }
        public Nullable<System.DateTime> Last_Call_Date_Home { get; set; }
        public Nullable<System.DateTime> Last_Call_Date_Work { get; set; }
        public Nullable<System.DateTime> Last_Call_Date_Cell { get; set; }
        public Nullable<System.DateTime> Last_Call_Date_Other { get; set; }
        public string Last_Call_Time_Home { get; set; }
        public string Last_Call_Time_Work { get; set; }
        public string Last_Call_Time_Cell { get; set; }
        public string Last_Call_Time_Other { get; set; }
        public string Bur_Update_ID { get; set; }
        public Nullable<System.DateTime> Bur_Update_Date { get; set; }
        public Nullable<System.DateTime> Bur_Status_Date { get; set; }
        public string Bur_Status { get; set; }
        public string Bur_Dispute_Status { get; set; }
        public string Bur_BKT_Status { get; set; }
        public string Bur_Special_Status { get; set; }
    
        public virtual RACCOUNT RACCOUNT { get; set; }
    }
}
