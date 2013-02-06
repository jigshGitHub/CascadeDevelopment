--Executed 239/dbpcs on 2/5 3:00PM

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCRAReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceNCRAReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceNCRAReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCPReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceNCPReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceNCPReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceAAIReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceAAIReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceAAIReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceSOAReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceSOAReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceSOAReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceORPReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceORPReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceORPReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceRCReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceRCReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceRCReportDataExport]
GO


/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCRAReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[MSI_spGetComplianceNCRAReportDataExport]
  @AgencyId varchar(20)  
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount
			where cm.ComplaintSubmitedToAgency = 1
			and cm.ComplaintSubmitedToAgencyDate is not null
			and cm.ComplaintSubmittedToOwner = 0
			and Upper(rl.LoweredRoleName) = 'USER'
	    End
	
	if @AgencyId != ''
		Begin
	        Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount
			where cm.ComplaintSubmitedToAgency = 1
			and cm.ComplaintSubmitedToAgencyDate is not null
			and cm.ComplaintSubmittedToOwner = 0
			and Upper(rl.LoweredRoleName) = 'USER'
			-- Only needs this condition if Agency is logged in and viewing their own data
		    and cm.AgencyId = @AgencyId;
	End
    
  End

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCPReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceNCPReportDataExport]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount
			
		 where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.IsViewedByAgency=1
			
	    End
	
	if @AgencyId != ''
		Begin	  	
		Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.IsViewedByAgency=1			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceAAIReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceAAIReportDataExport]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount
		 where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.MoreInfoReqdFromDebtor=1
			
	    End
	
	if @AgencyId != ''
		Begin	  	
		Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.MoreInfoReqdFromDebtor=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceSOAReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceSOAReportDataExport]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText

			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount

		where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=0
			
	    End
	
	if @AgencyId != ''
		Begin	  	
		Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText

			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount

			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=0
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceORPReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceORPReportDataExport]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount

			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=1
			
	    End
	
	if @AgencyId != ''
		Begin	  	
		Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText
			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount

			
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceRCReportDataExport]    Script Date: 02/05/2013 10:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceRCReportDataExport]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText

			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount

			where cm.DebtorAgree=1 and FinalActionStepId is not null
			
	    End
	
	if @AgencyId != ''
		Begin	  	
		Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName,	Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.Address,'') as Address,Isnull(cm.City,'') as City,
			Isnull(cm.State,'') as State,Isnull(cm.Zip,'') as Zip,
			Isnull(cm.CreditorName,'') as CreditorName,	
			Isnull(ysn1.Description,'No') as DebtorIdentityVerifiedText,
			Isnull(dcm.Method,'') as ContactMethod,
			Isnull(dct.Time,'') as ContactTime,
			Isnull(dprd.Product,'') as DebtProduct,
			Isnull(cm.DebtPurchaseBalance,'') as DebtPurchaseBalance,
			Isnull(cm.DebtCurrentBalance,'') as DebtCurrentBalance,
			Isnull(ysn2.Description,'No') as DisputeDebtText,
			cm.ComplaintId,
			Isnull(cm.ComplaintDate,'') as ComplaintDate,
			Isnull(crb.Media,'') as ComplaintReceivedByMethod,
			Isnull(cpi.Name,'') as ComplaintIssue,
			Isnull(cm.ComplaintNotes,'') as ComplaintNotes,
			Isnull(ysn3.Description,'No') as ComplaintSubmitedToAgencyText, 
			Isnull(cm.ComplaintSubmitedToAgencyDate,'') as ComplaintSubmitedToAgencyDate,
			Isnull(ysn4.Description,'No') as MoreInfoReqdFromDebtorText,
			Isnull(cm.MoreInfoRequestedDate,'') as MoreInfoRequestedDate,
			Isnull(cm.MoreInfoRequested,'') as MoreInfoRequested,
			Isnull(ysn5.Description,'No') as MoreInfoReceivedFromDebtorText,
			Isnull(cm.MoreInfoReceivedDate,'') as MoreInfoReceivedDate,
			Isnull(cm.MoreInfoReceived,'') as MoreInfoReceived,
			Isnull(ysn6.Description,'No') as ComplaintSubmittedToOwnerText,
			Isnull(cm.ComplaintSubmittedDate,'') as ComplaintSubmittedDate,
			Isnull(cm.TimeToSubmitDays,0) as TimeToSubmitDays,
			Isnull(ysn7.Description,'No') as MoreInfoFromAgencyText,
			Isnull(cm.MoreInfoFromAgencyRequestedDate,'') as MoreInfoFromAgencyRequestedDate,
			Isnull(cm.MoreInfoFromAgencyRequested,'') as MoreInfoFromAgencyRequested,
			Isnull(cm.MoreInfoFromAgencyReceived,'') as MoreInfoFromAgencyReceived,
			Isnull(cm.MoreInfoFromAgencyReceivedDate,'') as MoreInfoFromAgencyReceivedDate,
			Isnull(onr.Response,'') as OwnerResponse,
			Isnull(cm.OwnerResponseDate,'') as OwnerResponseDate,
			Isnull(cm.OwnerResponseDays,0) as OwnerResponseDays,
			Isnull(cm.AgencyResponseToDebtorDate,'') as AgencyResponseToDebtorDate,
			Isnull(cm.TotalResponseTimeDays,0) as TotalResponseTimeDays,
			Isnull(ysn8.Description,'No') as DebtorAgreeText,
			Isnull(ysn9.Description,'No') as NeedFurtherActionText,
			Isnull(fas.Step,'') as FinalActionStep,
			Isnull(ysn10.Description,'No') as IsViewedByOwnerText,
			au.UserName as CreatedBy,
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText,
			Isnull(ysn12.Description,'No') as DisputeDebtDueDateText,
			Isnull(ysn13.Description,'No') as DisputeDebtAmountText

			From MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			Inner join aspnet_Users au on au.UserId = ur.UserId	inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			left outer join tbl_YesNoOptions ysn1 on ysn1.value = cm.DebtorIdentityVerified
			left outer join MSI_DebtorContactMethods dcm on dcm.Id = cm.ContactMethodId
			left outer join MSI_DebtorContactTime dct on dct.Id = cm.ContactTimeId
			left outer join MSI_DebtorProducts dprd on dprd.Id = cm.DebtProductId
			left outer join tbl_YesNoOptions ysn2 on ysn2.value = cm.DisputeDebt
			left outer join MSI_ComplaintReceviedBy crb on crb.Id = cm.ComplaintReceivedByMethodId
			left outer join MSI_ComplaintIssues cpi on cpi.id = cm.ComplaintIssueId
			left outer join tbl_YesNoOptions ysn3 on ysn3.Value = cm.ComplaintSubmitedToAgency
			left outer join tbl_YesNoOptions ysn4 on ysn4.Value = cm.MoreInfoReqdFromDebtor
			left outer join tbl_YesNoOptions ysn5 on ysn5.Value = cm.MoreInfoReceivedFromDebtor
			left outer join tbl_YesNoOptions ysn6 on ysn6.Value = cm.ComplaintSubmittedToOwner
			left outer join tbl_YesNoOptions ysn7 on ysn7.Value = cm.MoreInfoFromAgency
			left outer join MSI_OwnerResponses onr on onr.Id = cm.OwnerResponseId
			left outer join tbl_YesNoOptions ysn8 on ysn8.Value = cm.DebtorAgree
			left outer join tbl_YesNoOptions ysn9 on ysn9.Value = cm.NeedFurtherAction
			left outer join MSI_FinalActionsteps fas on fas.Id = cm.FinalActionStepId
			left outer join tbl_YesNoOptions ysn10 on ysn10.Value = cm.IsViewedByOwner
			left outer join tbl_YesNoOptions ysn11 on ysn11.Value = cm.IsViewedByAgency
			left outer join tbl_YesNoOptions ysn12 on ysn12.Value = cm.DisputeDebtDueDate
			left outer join tbl_YesNoOptions ysn13 on ysn13.Value = cm.DisputeDebtAmount

			where cm.DebtorAgree=1 and FinalActionStepId is not null
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO


