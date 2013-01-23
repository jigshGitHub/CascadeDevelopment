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
    
    public partial class RACCTLGL
    {
        public string DIVISION_ID { get; set; }
        public string ACCOUNT { get; set; }
        public Nullable<decimal> JUDG_BAL_DUE { get; set; }
        public Nullable<decimal> JUDG_PRIN_DUE { get; set; }
        public Nullable<decimal> JUDG_INT_DUE { get; set; }
        public Nullable<decimal> JUDG_COSTS_DUE { get; set; }
        public Nullable<decimal> JUDG_OTHER_DUE { get; set; }
        public Nullable<int> WHO_SUED { get; set; }
        public string SUIT_STATE { get; set; }
        public string SUIT_COUNTY { get; set; }
        public string SUIT_COURT { get; set; }
        public string SUIT_ATTY { get; set; }
        public Nullable<System.DateTime> COMPLAINT_DATE { get; set; }
        public Nullable<decimal> COMPLAINT_AMT { get; set; }
        public string CASE_NO { get; set; }
        public Nullable<System.DateTime> DATE_SERVED1 { get; set; }
        public string SERVICER1 { get; set; }
        public string LOCATION_SERV1 { get; set; }
        public string P_A_SERV1 { get; set; }
        public Nullable<System.DateTime> DATE_SERVED2 { get; set; }
        public string SERVICER2 { get; set; }
        public string LOCATION_SERV2 { get; set; }
        public string P_A_SERV2 { get; set; }
        public Nullable<System.DateTime> HEARING_DATE { get; set; }
        public Nullable<System.DateTime> TRIAL_DATE { get; set; }
        public Nullable<System.DateTime> STIP_DATE { get; set; }
        public Nullable<decimal> STIP_AMOUNT { get; set; }
        public Nullable<decimal> STIP_PRINCIPAL { get; set; }
        public Nullable<decimal> STIP_INTEREST { get; set; }
        public Nullable<decimal> STIP_COSTS { get; set; }
        public Nullable<decimal> STIP_OTHER { get; set; }
        public string STIP_INT_RATE { get; set; }
        public Nullable<System.DateTime> JUDGEMENT_DATE { get; set; }
        public Nullable<System.DateTime> JUDGEMENT_EXP { get; set; }
        public Nullable<int> JUDGEMENT_RENEW { get; set; }
        public Nullable<decimal> JUDGEMENT_AMT { get; set; }
        public Nullable<decimal> JUDGEMENT_PRIN { get; set; }
        public Nullable<decimal> JUDGEMENT_INT { get; set; }
        public Nullable<decimal> JUDGEMENT_COST { get; set; }
        public Nullable<decimal> JUDGEMENT_OTHER { get; set; }
        public Nullable<decimal> JUDGEMENT_PJ_CR { get; set; }
        public string JUDGEMENT_INTRT { get; set; }
        public Nullable<System.DateTime> GARN_DATE { get; set; }
        public Nullable<System.DateTime> GARN_EXP_DATE { get; set; }
        public string GARN_WHO { get; set; }
        public string GARN_ADDRESS { get; set; }
        public string GARN_P_A_ADDR { get; set; }
        public Nullable<System.DateTime> ABST_DATE { get; set; }
        public string ABST_LOCATION { get; set; }
        public string ABST_P_A_LOC { get; set; }
        public string ABST_RECORDER { get; set; }
        public string ABST_REFERENCE { get; set; }
        public Nullable<System.DateTime> WRIT_DATE { get; set; }
        public Nullable<System.DateTime> WRIT_EXP { get; set; }
        public Nullable<System.DateTime> OTHER_DATE { get; set; }
        public string OTHER_DESC { get; set; }
        public Nullable<decimal> UPDATE_TIME { get; set; }
        public Nullable<System.DateTime> UPDATE_DATE { get; set; }
        public string UPDATE_TYPE { get; set; }
        public string UPDATE_ID { get; set; }
        public Nullable<System.DateTime> ACCUM_DATE { get; set; }
        public Nullable<decimal> ACCUM_INT_PRIN { get; set; }
        public Nullable<decimal> ACCUM_INT_INT { get; set; }
        public Nullable<decimal> ACCUM_INT_COST { get; set; }
        public Nullable<decimal> ACCUM_INT_OTHER { get; set; }
        public string SERVICER1_TYPE { get; set; }
        public string SERVICER2_TYPE { get; set; }
        public string COURT_TYPE { get; set; }
        public Nullable<decimal> HEARING_TIME { get; set; }
        public Nullable<decimal> TRIAL_TIME { get; set; }
        public string OTHER_DESC2 { get; set; }
        public string WRIT_COURT_TYPE { get; set; }
        public string WRIT_STATE { get; set; }
        public string STIP_DESC { get; set; }
        public Nullable<System.DateTime> JUDGEMENT_INT_START_DATE { get; set; }
        public string WRIT_COURT { get; set; }
        public Nullable<System.DateTime> WRIT_REQUEST_DATE { get; set; }
        public Nullable<System.DateTime> WRIT_SENT_DATE { get; set; }
        public string DocketNumber { get; set; }
        public Nullable<System.DateTime> Docket_Date { get; set; }
        public Nullable<System.DateTime> Stay_Date { get; set; }
        public string COURT_DISTRICT { get; set; }
        public string COURT_NAME { get; set; }
        public string COURT_ADDRESS1 { get; set; }
        public string COURT_ADDRESS2 { get; set; }
        public string COURT_CITY { get; set; }
        public string COURT_STATE { get; set; }
        public string COURT_ZIP { get; set; }
        public string COURT_COUNTY { get; set; }
        public string COURT_PHONE { get; set; }
        public string COURT_FAX { get; set; }
        public Nullable<System.DateTime> LetterDate1 { get; set; }
        public string Exemption { get; set; }
        public string ExemptionType { get; set; }
        public Nullable<System.DateTime> ExemptionDate { get; set; }
        public Nullable<System.DateTime> ExemptionExpirationDate { get; set; }
        public Nullable<decimal> FilingFees { get; set; }
        public string GarnBank1 { get; set; }
        public string GarnBankAccount1 { get; set; }
        public string GarnRouting1 { get; set; }
        public string GarnBank1Address1 { get; set; }
        public string GarnBank1Address2 { get; set; }
        public string GarnBank1State { get; set; }
        public string GarnBank1City { get; set; }
        public string GarnBank1Zip { get; set; }
        public string GarnBank1County { get; set; }
        public string GarnBank1Phone { get; set; }
        public string GarnBank1Fax { get; set; }
        public string GarnBank2 { get; set; }
        public string GarnBankAccount2 { get; set; }
        public string GarnRouting2 { get; set; }
        public string GarnBank2Address1 { get; set; }
        public string GarnBank2Address2 { get; set; }
        public string GarnBank2City { get; set; }
        public string GarnBank2State { get; set; }
        public string GarnBank2Zip { get; set; }
        public string GarnBank2County { get; set; }
        public string GarnBank2Phone { get; set; }
        public string GarnBank2Fax { get; set; }
        public Nullable<System.DateTime> ABST_ISSUANCE_DATE { get; set; }
        public Nullable<System.DateTime> ABST_RECORDING_DATE { get; set; }
        public string ABST_DOCUMENT_NUMBER { get; set; }
        public Nullable<decimal> ABST_FEE { get; set; }
        public Nullable<decimal> ABST_RECORDING_FEE { get; set; }
        public Nullable<int> TaskID { get; set; }
    
        public virtual RACCOUNT RACCOUNT { get; set; }
    }
}
