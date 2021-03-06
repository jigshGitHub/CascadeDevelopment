﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Cascade.Data.Models;
using Cascade.Data.Repositories;

namespace Cascade.Web.Controllers
{
    public class DebtorsController : ApiController
    {
        public IEnumerable<MSI_Debtor> Get(string accountNumber)
        {
            IEnumerable<MSI_Debtor> debtors = null;

            try
            {
                DataQueries query = new DataQueries();
                debtors = query.GetDebtors(accountNumber);
            }
            catch (Exception ex)
            {
            }
            return debtors;
        }
    }
    public class ComplianceController : ApiController
    {
        private void PopulateDebtInfo(MSI_Debtor debtor, MSI_ComplaintMain complaint)
        {
            complaint.Account = debtor.Account;
            complaint.FirstName = debtor.FirstName;
            complaint.LastName = debtor.LastName;
            complaint.Address = debtor.Address1 + " " + debtor.Address2;
            complaint.City = debtor.City;
            complaint.State = debtor.State;
            complaint.Zip = debtor.Zip;
            complaint.LastFourSSN = debtor.LastFourSSN;
            complaint.MobilePhone = debtor.MobilePhone;
            complaint.HomePhone = debtor.HomePhone;
            complaint.WorkPhone = debtor.WorkPhone;
            complaint.DebtCurrentBalance = debtor.DebtCurrentBalance;
            complaint.DebtPurchaseBalance = debtor.DebtPurchaseBalance;
            complaint.CreditorName = debtor.CreditorName;
        }

        public MSI_ComplaintMain Get(string accountNumber, string agencyId, string userRole)
        {
            MSI_ComplaintMainRepository repository = null;
            MSI_ComplaintMain complaint = null; ;
            try
            {

                repository = new MSI_ComplaintMainRepository();
                IEnumerable<MSI_ComplaintMain> data = (from existingComplaint in repository.GetAll().Where(record => record.AgencyId == agencyId && record.Account == accountNumber)
                                                       select existingComplaint);

                if (data.Count() > 0)
                {
                    complaint = data.First();
                    if (!string.IsNullOrEmpty(userRole))
                    {
                        if (userRole == "user")
                            complaint.IsViewedByOwner = true;
                        if (userRole == "agency")
                            complaint.IsViewedByAgency = true;
                        repository.Update(complaint);
                    }
                }
                else
                {
                    complaint = new MSI_ComplaintMain();
                    complaint.AgencyId = agencyId;
                    complaint.ComplaintDate = DateTime.Now;
                    IEnumerable<MSI_Debtor> debtors = null;
                    DataQueries query = new DataQueries();
                    debtors = query.GetDebtors(accountNumber);

                    PopulateDebtInfo(debtors.First(), complaint);
                    //PopulateComplaintID(complaint);
                }
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException validationException)
            {
                foreach (System.Data.Entity.Validation.DbEntityValidationResult errorResult in validationException.EntityValidationErrors)
                {
                    foreach (System.Data.Entity.Validation.DbValidationError error in errorResult.ValidationErrors)
                    {
                        string data = error.ErrorMessage;
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return complaint;
        }

        public MSI_ComplaintMain Post(MSI_ComplaintMain complaint)
        {
            MSI_ComplaintMain complaintToSave = null;
            MSI_ComplaintMainRepository repository = null;
            bool editingRequired = true;
            try
            {

                repository = new MSI_ComplaintMainRepository();
                IEnumerable<MSI_ComplaintMain> data = (from existingComplaint in repository.GetAll().Where(record => record.AgencyId == complaint.AgencyId && record.Account == complaint.Account)
                                                       select existingComplaint);

                if (data.Count() > 0)
                {
                    complaintToSave = data.First();
                }
                else
                {
                    editingRequired = false;
                    complaintToSave = new MSI_ComplaintMain();
                }



                complaintToSave.AgencyId = complaint.AgencyId;
                complaintToSave.Account = complaint.Account;
                complaintToSave.LastName = complaint.LastName;
                complaintToSave.FirstName = complaint.FirstName;
                complaintToSave.Address = complaint.Address;
                complaintToSave.City = complaint.City;
                complaintToSave.State = complaint.State;
                complaintToSave.Zip = complaint.Zip;
                complaintToSave.HomePhone = complaint.HomePhone;
                complaintToSave.WorkPhone = complaint.WorkPhone;
                complaintToSave.MobilePhone = complaint.MobilePhone;
                complaintToSave.LastFourSSN = complaint.LastFourSSN;
                complaintToSave.DebtorIdentityVerified = complaint.DebtorIdentityVerified;
                complaintToSave.ContactMethodId = complaint.ContactMethodId;
                complaintToSave.ContactTimeId = complaint.ContactTimeId;
                complaintToSave.CreditorName = complaint.CreditorName;
                complaintToSave.DebtProductId = complaint.DebtProductId;
                complaintToSave.DebtPurchaseBalance = complaint.DebtPurchaseBalance;
                complaintToSave.DebtCurrentBalance = complaint.DebtCurrentBalance;
                complaintToSave.DisputeDebt = complaint.DisputeDebt;
                complaintToSave.DisputeDebtAmount = complaint.DisputeDebtAmount;
                complaintToSave.DisputeDebtDueDate = complaint.DisputeDebtDueDate;
                complaintToSave.ComplaintID = complaint.ComplaintID;
                complaintToSave.ComplaintDate = complaint.ComplaintDate;
                complaintToSave.ComplaintReceivedByMethodId = complaint.ComplaintReceivedByMethodId;
                complaintToSave.ComplaintIssueId = complaint.ComplaintIssueId;
                complaintToSave.ComplaintNotes = complaint.ComplaintNotes;
                complaintToSave.ComplaintSubmitedToAgency = complaint.ComplaintSubmitedToAgency;
                complaintToSave.ComplaintSubmitedToAgencyDate = complaint.ComplaintSubmitedToAgencyDate;
                complaintToSave.MoreInfoReqdFromDebtor = complaint.MoreInfoReqdFromDebtor;
                complaintToSave.MoreInfoRequestedDate = complaint.MoreInfoRequestedDate;
                complaintToSave.MoreInfoRequested = complaint.MoreInfoRequested;
                complaintToSave.MoreInfoReceivedFromDebtor = complaint.MoreInfoReceivedFromDebtor;
                complaintToSave.MoreInfoReceivedDate = complaint.MoreInfoReceivedDate;
                complaintToSave.MoreInfoReceived = complaint.MoreInfoReceived;
                complaintToSave.ComplaintSubmittedToOwner = complaint.ComplaintSubmittedToOwner;
                complaintToSave.ComplaintSubmittedDate = complaint.ComplaintSubmittedDate;
                complaintToSave.TimeToSubmitDays = complaint.TimeToSubmitDays;
                complaintToSave.MoreInfoFromAgency = complaint.MoreInfoFromAgency;
                complaintToSave.MoreInfoFromAgencyRequestedDate = complaint.MoreInfoFromAgencyRequestedDate;
                complaintToSave.MoreInfoFromAgencyRequested = complaint.MoreInfoFromAgencyRequested;
                complaintToSave.MoreInfoFromAgencyReceived = complaint.MoreInfoFromAgencyReceived;
                complaintToSave.MoreInfoFromAgencyReceivedDate = complaint.MoreInfoFromAgencyReceivedDate;
                complaintToSave.OwnerResponseId = complaint.OwnerResponseId;
                complaintToSave.OwnerResponseDate = complaint.OwnerResponseDate;
                complaintToSave.OwnerResponseDays = complaint.OwnerResponseDays;
                if (complaint.AgencyResponseToDebtorDate.HasValue)
                    complaintToSave.AgencyResponseToDebtorDate = complaint.AgencyResponseToDebtorDate;
                complaintToSave.TotalResponseTimeDays = complaint.TotalResponseTimeDays;
                complaintToSave.DebtorAgree = complaint.DebtorAgree;
                complaintToSave.NeedFurtherAction = complaint.NeedFurtherAction;
                complaintToSave.FinalActionStepId = complaint.FinalActionStepId;
                complaintToSave.IsViewedByOwner = complaint.IsViewedByOwner;
                complaintToSave.CreatedBy = complaint.CreatedBy;
                complaintToSave.IsViewedByAgency = complaint.IsViewedByAgency;

                if (editingRequired)
                {
                    repository.Update(complaintToSave);
                }
                else
                {
                    complaintToSave.ComplaintSubmitedToAgency = true;
                    complaintToSave.ComplaintSubmitedToAgencyDate = DateTime.Now;
                    repository.Add(complaintToSave);
                }
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException validationException)
            {
                foreach (System.Data.Entity.Validation.DbEntityValidationResult errorResult in validationException.EntityValidationErrors)
                {
                    foreach (System.Data.Entity.Validation.DbValidationError error in errorResult.ValidationErrors)
                    {
                        string data = error.ErrorMessage;
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return complaintToSave;
        }

        private void PopulateComplaintID(MSI_ComplaintMain complaint)
        {
            if (string.IsNullOrEmpty(complaint.ComplaintID))
            {
                Random rnd = new Random();

                complaint.ComplaintID = complaint.AgencyId + "-" + complaint.Account.Substring(5, 10) + "-" + rnd.Next(101, 999).ToString();
            }
        }
    }
}
