--Executed 239/dpcs on 02/05 3:40AM
/****** Object:  View [dbo].[MSI_vwDebtors]    Script Date: 02/05/2013 03:19:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MSI_vwDebtors]'))
DROP VIEW [dbo].[MSI_vwDebtors]
GO


/****** Object:  View [dbo].[MSI_vwDebtors]    Script Date: 02/05/2013 03:19:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[MSI_vwDebtors]
As
SELECT vwAcc.ACCOUNT, 
vwAcc.FirstName
,vwAcc.LastName
,vwAcc.ADDRESS1
,vwAcc.ADDRESS2
,vwAcc.CITY
,vwAcc.[STATE]
,vwAcc.ZIP_CODE
,vwAcc.ZIP
,vwAcc.SSN
,vwAcc.SS_NO
,vwAcc.PHONE_CELL
,vwAcc.PHONE_HOME
,vwAcc.PHONE_WORK
,vwAcc.DOB
,vwAcc.Balance As DebtCurrentBalance
,vwAcc.OriginalBalance As DebtorPurchaseBalance
,vwAcc.CreditorName
From vwAccounts vwAcc INNER JOIN RACCOUNT rAcc ON vwAcc.ACCOUNT = rAcc.ACCOUNT
GO
--Bhavesh's change

Alter Table dbo.MSI_MediaForm Add [FileName] varchar(150) null;

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCRAReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceNCRAReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceNCRAReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCRAReportData]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceNCRAReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceNCRAReportData]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCPReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceNCPReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceNCPReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCPReportData]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceNCPReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceNCPReportData]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceAAIReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceAAIReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceAAIReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceAAIReportData]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceAAIReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceAAIReportData]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceSOAReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceSOAReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceSOAReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceSOAReportData]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceSOAReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceSOAReportData]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceORPReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceORPReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceORPReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceORPReportData]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceORPReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceORPReportData]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceRCReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceRCReportDataExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceRCReportDataExport]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceRCReportData]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetComplianceRCReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetComplianceRCReportData]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetMediaViewEditRecordsExport]    Script Date: 02/04/2013 23:24:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetMediaViewEditRecordsExport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetMediaViewEditRecordsExport]
GO

USE [CascadeDB]
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCRAReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			where cm.ComplaintSubmitedToAgency = 1
			and cm.ComplaintSubmitedToAgencyDate is not null
			and cm.ComplaintSubmittedToOwner = 0
			and Upper(rl.LoweredRoleName) = 'USER'
			-- Only needs this condition if Agency is logged in and viewing their own data
		    and cm.AgencyId = @AgencyId;
	End
    
  End

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCRAReportData]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[MSI_spGetComplianceNCRAReportData]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,
			Isnull(cm.HomePhone,'') as HomePhone,
			Isnull(cm.WorkPhone,'') as WorkPhone,
			Isnull(cm.MobilePhone,'') as MobilePhone,
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate	,
			cm.TotalResponseTimeDays
			from MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 			
		where Upper(rl.LoweredRoleName) = 'USER'
		and cm.ComplaintSubmitedToAgency = 1
			and cm.ComplaintSubmitedToAgencyDate is not null
			and cm.ComplaintSubmittedToOwner = 0
	    End
	
	if @AgencyId != ''
		Begin
	  Select 
		cm.AgencyId,  ra.NAME as AgencyName,
		Isnull(cm.LastName,'') as LastName, 
		Isnull(cm.FirstName,'') as FirstName,
		Isnull(cm.Account,'') as PIMSAccount,
		Isnull(cm.ComPlaintId,'') as ComPlaintId,
		Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
		Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays
		from MSI_ComplaintMain cm		
		inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 			
		where cm.AgencyId = @AgencyId
		and Upper(rl.LoweredRoleName) = 'USER'
		and cm.ComplaintSubmitedToAgency = 1
			and cm.ComplaintSubmitedToAgencyDate is not null
			and cm.ComplaintSubmittedToOwner = 0
	End
    
  End

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCPReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.IsViewedByAgency=1			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceNCPReportData]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceNCPReportData]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays		
			from MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.IsViewedByAgency=1
			
	    End
	
	if @AgencyId != ''
		Begin
	  Select 		
		cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
	Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays
		from MSI_ComplaintMain cm
		inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.IsViewedByAgency=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceAAIReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.MoreInfoReqdFromDebtor=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceAAIReportData]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceAAIReportData]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate		,
			cm.TotalResponseTimeDays
			from MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.MoreInfoReqdFromDebtor=1
			
	    End
	
	if @AgencyId != ''
		Begin
	  Select 		
		cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
	Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays
		from MSI_ComplaintMain cm
		inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmitedToAgencyDate is not null
			 and cm.ComplaintSubmittedToOwner=0
			 and cm.ComplaintSubmittedDate is null and cm.MoreInfoReqdFromDebtor=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceSOAReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=0
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceSOAReportData]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceSOAReportData]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate		,
			cm.TotalResponseTimeDays
			from MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=0
			
	    End
	
	if @AgencyId != ''
		Begin
	  Select 		
		cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
	Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate	
			,cm.TotalResponseTimeDays
		from MSI_ComplaintMain cm
		inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=0
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceORPReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceORPReportData]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceORPReportData]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays
			from MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=1
			
	    End
	
	if @AgencyId != ''
		Begin
	  Select 		
		cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate	,
			cm.TotalResponseTimeDays
		from MSI_ComplaintMain cm
		inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.ComplaintSubmittedToOwner=1 and cm.IsViewedByOwner=1
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceRCReportDataExport]    Script Date: 02/04/2013 23:24:05 ******/
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			Isnull(cm.DisputeDebtAmount,'') as DisputeDebtAmount,
			Isnull(cm.DisputeDebtDueDate,'') as DisputeDebtDueDate,
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
			Isnull(ysn11.Description,'No') as IsViewedByAgencyText
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
			where cm.DebtorAgree=1 and FinalActionStepId is not null
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetComplianceRCReportData]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetComplianceRCReportData]
  @AgencyId varchar(20)
AS
  
  Begin
    
    -- get data
	if @AgencyId = ''
		Begin
			Select 
			cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays			
			from MSI_ComplaintMain cm
			inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.DebtorAgree=1 and FinalActionStepId is not null
			
	    End
	
	if @AgencyId != ''
		Begin
	  Select 		
		cm.AgencyId,  ra.NAME as AgencyName,
			Isnull(cm.LastName,'') as LastName, 
			Isnull(cm.FirstName,'') as FirstName,
			Isnull(cm.Account,'') as PIMSAccount,
			Isnull(cm.ComPlaintId,'') as ComPlaintId,		
			Isnull(cm.LastFourSSN,'') as LastFourSSN,
			Isnull(cm.HomePhone,'') as HomePhone,
		Isnull(cm.WorkPhone,'') as WorkPhone,
		Isnull(cm.MobilePhone,'') as MobilePhone,
			Convert(varchar(20),ComplaintDate,101) as ComplaintDate,
			Convert(varchar(20),AgencyResponseToDebtorDate,101) as AgencyResponseToDebtorDate,
			Convert(varchar(20),MoreInfoRequestedDate,101) as MoreInfoRequestedDate,
			Convert(varchar(20),ComplaintSubmittedDate,101) as ComplaintSubmittedDate,
			cm.TotalResponseTimeDays			
		from MSI_ComplaintMain cm
		inner join RAGENCY ra on ra.AGENCY_ID = cm.AgencyId
			inner join aspnet_UsersInRoles ur on ur.UserId = cm.CreatedBy
			inner join aspnet_Roles rl on rl.RoleId = ur.RoleId 
			where cm.DebtorAgree=1 and FinalActionStepId is not null
			
		    and cm.AgencyId = @AgencyId;
	End
    
  End
  

GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetMediaViewEditRecordsExport]    Script Date: 02/04/2013 23:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[MSI_spGetMediaViewEditRecordsExport]
	@StartDate datetime = NULL,
	@EndDate datetime = NULL,
	@PortfolioOwner VARCHAR(255) = NULL,
	@Responsibility VARCHAR(255) = NULL,
	@Account VARCHAR(255) = NULL,
	@GUID VARCHAR(255) = NULL
	
AS
	DECLARE @sqlQry VARCHAR(MAX);
	DECLARE @selectClause VARCHAR(1500);
	DECLARE @whereClause VARCHAR(MAX);
	DECLARE @isANDReq bit;
	
	SET @isANDReq = 0;

	--SET @selectClause = 'Select * FROM MSI_vwSearch search '
	SET @selectClause = 'Select 
	  ID
      ,CompanyRequesting
      ,Portfolio
      ,OriginalLender
      ,OrigAcct
      ,SSN
      ,AcctName
      ,IsApplication
      ,IsAffidavitIssuer
      ,IsAffidavitSeller
      ,Isnull(StmtsFrom,'''') as StmtsFrom 
      ,Isnull(StmtsTo,'''') as StmtsTo 
      ,Isnull(OpenDate,'''') as OpenDate
      ,Isnull(OrderDate,'''') as OrderDate
      ,Isnull(CODate,'''') as CODate
      ,Explanation
      ,Isnull(DateSubmitted,'''') as DateSubmitted 
      ,Isnull(DateConfirmed,'''') as DateConfirmed  
      ,SellerFee
      ,Isnull(DateSellerPaid,'''') as DateSellerPaid  
      ,OurFee
      ,Isnull(DateReceived,'''') as DateReceived  
      ,Isnull(DateForwarded,'''') as DateForwarded  
      ,MediaTypeReceived
      ,Notes
      ,IsUnavailable
      ,IsClosed
      ,Isnull(UnavailableDate,'''') as UnavailableDate  
      ,SellerInvoice
      ,Isnull(DatePayRec,'''') as DatePayRec  
      ,BuyerCheck
      ,OurCheck
      ,PIMSAcct
      ,Seller
      ,OrderNumber
      ,OurInvoice
      ,GUID, FileName
      FROM MSI_MediaForm search '
	SET @whereClause = 'Where ';

	IF @PortfolioOwner IS NOT NULL
	BEGIN
		SET @whereClause = @whereClause + ' search.Portfolio = ''' + @PortfolioOwner + ''''
		SET @isANDReq = 1
	END
	
	IF @Account IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		
		SET @whereClause = @whereClause + ' search.PIMSAcct = ' + @Account
		SET @isANDReq = 1
	END

	IF @GUID IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		
		SET @whereClause = @whereClause + ' search.GUID = ''' + @GUID + ''''
		SET @isANDReq = 1
	END
		
	IF @Responsibility IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		
		SET @whereClause = @whereClause + ' search.CompanyRequesting = ''' + @Responsibility + ''''
		SET @isANDReq = 1
	END
	
	
	IF @StartDate IS NOT NULL And @EndDate IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		
		SET @whereClause = @whereClause + ' search.OpenDate between ''' + Convert(Varchar,@StartDate,101) + ''' and ''' + Convert(Varchar,@EndDate,101) + ''''
		SET @isANDReq = 1
	END
		
	
	SET @sqlQry = @selectClause + @whereClause;

	PRINT @sqlQry;

	EXECUTE(@sqlQry);

GO


