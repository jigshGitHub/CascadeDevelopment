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
    
    public partial class MSI_ComplaintMain
    {
        public string AgencyId { get; set; }
        public string Account { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string HomePhone { get; set; }
        public string WorkPhone { get; set; }
        public string MobilePhone { get; set; }
        public string LastFourSSN { get; set; }
        public Nullable<bool> DebtorIdentityVerified { get; set; }
        public Nullable<int> ContactMethodId { get; set; }
        public Nullable<int> ContactTimeId { get; set; }
        public string CreditorName { get; set; }
        public Nullable<int> DebtProductId { get; set; }
        public string DebtPurchaseBalance { get; set; }
        public string DebtCurrentBalance { get; set; }
        public Nullable<bool> DisputeDebt { get; set; }
        public Nullable<bool> DisputeDebtAmount { get; set; }
        public Nullable<bool> DisputeDebtDueDate { get; set; }
        public string ComplaintID { get; set; }
        public System.DateTime ComplaiintDate { get; set; }
        public Nullable<int> ComplaintReceivedByMethodId { get; set; }
        public int ComplaintIssueId { get; set; }
        public string ComplaintNotes { get; set; }
        public Nullable<bool> ComplaintSubmitedToAgency { get; set; }
        public Nullable<System.DateTime> ComplaintSubmitedToAgencyDate { get; set; }
        public Nullable<bool> MoreInfoReqdFromDebtor { get; set; }
        public Nullable<System.DateTime> MoreInfoRequestedDate { get; set; }
        public string MoreInfoRequested { get; set; }
        public Nullable<bool> MoreInfoReceivedFromDebtor { get; set; }
        public Nullable<System.DateTime> MoreInfoReceivedDate { get; set; }
        public string MoreInfoReceived { get; set; }
        public Nullable<bool> ComplaintSubmittedToOwner { get; set; }
        public Nullable<System.DateTime> ComplaintSubmittedDate { get; set; }
        public Nullable<int> TimeToSubmitDays { get; set; }
        public Nullable<bool> MoreInfoFromAgency { get; set; }
        public Nullable<System.DateTime> MoreInfoFromAgencyRequestedDate { get; set; }
        public string MoreInfoFromAgencyRequested { get; set; }
        public string MoreInfoFromAgencyReceived { get; set; }
        public Nullable<System.DateTime> MoreInfoFromAgencyReceivedDate { get; set; }
        public Nullable<int> OwnerResponseId { get; set; }
        public Nullable<System.DateTime> OwnerResponseDate { get; set; }
        public Nullable<int> OwnerResponseDays { get; set; }
        public Nullable<System.DateTime> AgencyResponseToDebtorDate { get; set; }
        public Nullable<int> TotalResponseTimeDays { get; set; }
        public Nullable<bool> DebotrAgree { get; set; }
        public Nullable<bool> NeedFurtherAction { get; set; }
        public Nullable<int> FinalActionStepId { get; set; }
    }
}