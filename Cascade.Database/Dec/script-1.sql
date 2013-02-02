/****** Object:  View [dbo].[MSI_vwSearch]    Script Date: 12/12/2012 02:04:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MSI_vwSearch]'))
DROP VIEW [dbo].[MSI_vwSearch]
GO

Create View [dbo].[MSI_vwSearch]
As
SELECT 
		rel.Name
	  ,rel.SS_NO AS SSN
      ,rProd.[DESCRIPTION] As ProductDescription
      ,wStat.[Description] AS WorkStatusDescription
      ,ragc.Name As RespAgency
      ,rStat.DESCR AS StatusDescription      
      ,ra.[DIVISION_ID]
      ,ra.[ACCOUNT]
      ,ra.[PrimaryAccount]
      ,ra.[InvoiceID]
      ,ra.[ToolSetID]
      ,ra.[WorkStatusID]
      ,ra.[DateWorked]
      ,ra.[DEBT_TYPE]
      ,ra.[PRODUCT_CODE]
      ,ra.[BRANCH_NUMBER]
      ,ra.[CREDIT_LIMIT]
      ,ra.[CONTRACT_DATE]
      ,ra.[INT_RATE_CODE]
      ,ra.[INT_START_DATE]
      ,ra.[CYCLE_CODE]
      ,ra.[LAST_POST_DATE]
      ,ra.[CHGOFF_DATE]
      ,ra.[CHGOFF_RSN_CODE]
      ,ra.[CHGOFF_PRINCPAL]
      ,ra.[CHGOFF_INTEREST]
      ,ra.[CHGOFF_OTH_AMTS]
      ,ra.[REASON_INTO_COL]
      ,ra.[FIRST_PAY_DEFAULT]
      ,ra.[CYCLES_DELQ]
      ,ra.[LAST_PAY_DATE]
      ,ra.[LAST_CONT_DATE]
      ,ra.[LAST_NOTE_DATE]
      ,ra.[LAST_NOTE_CODE]
      ,ra.[Transfer_By]
      ,ra.[Previous_Responsibility]
      ,ra.[Previous_Date_Placed]
      ,ra.[RESPONSIBILITY]
      ,ra.[RESP_TYPE]
      ,ra.[STATUS]
      ,ra.[Status_Change_Date]
      ,ra.[Previous_Status]
      ,ra.[Previous_Status_Date]
      ,ra.[ALLOC_CODE]
      ,ra.[TOT_CHARGES]
      ,ra.[TOT_PRINCIPAL]
      ,ra.[TOT_INTEREST]
      ,ra.[TOT_COST]
      ,ra.[TOT_OTHER]
      ,ra.[TOT_NUM_PMTS]
      ,ra.[TOT_PTD]
      ,ra.[TOT_PRIN_PTD]
      ,ra.[TOT_INT_PTD]
      ,ra.[TOT_COST_PTD]
      ,ra.[TOT_OTH_INC_PTD]
      ,ra.[TOT_DELQ_AMT]
      ,ra.[TOT_DUE_AMT]
      ,ra.[TOT_PRIN_DUE]
      ,ra.[TOT_INT_DUE]
      ,ra.[TOT_COSTS_DUE]
      ,ra.[TOT_OTHER_DUE]
      ,ra.[SETTLE_ALLOW]
      ,ra.[TOT_NSF_AMT]
      ,ra.[NUM_NSF_PMNTS]
      ,ra.[DATE_LAST_NSF]
      ,ra.[LAST_NSF_AMT]
      ,ra.[FRST_PMT_DATE]
      ,ra.[FIRST_PMT_AMOUNT]
      ,ra.[NEXT_CYCLE]
      ,ra.[CALL_ATMPS_CONT]
      ,ra.[WKDY_CALL_ATMPS]
      ,ra.[WKNT_CALL_ATMPS]
      ,ra.[WKND_CALL_ATMPS]
      ,ra.[PLACEMENT_CODE]
      ,ra.[DATE_SENT_AGENCY]
      ,ra.[DATE_LAST_RECALL]
      ,ra.[BAD_PHONE_FLAG]
      ,ra.[BAD_ADDR_FLAG]
      ,ra.[HOME_OWN_FLAG]
      ,ra.[HOLD_FLAG]
      ,ra.[FIRST_CONT_FLAG]
      ,ra.[LAST_CALL_NUM]
      ,ra.[LAST_CALL_DATE]
      ,ra.[LAST_CALL_TIME]
      ,ra.[LAST_CALL_RESULT]
      ,ra.[LAST_CALL_STATUS]
      ,ra.[LAST_LETTER_GENERATED]
      ,ra.[LAST_LETTER_GENERATED_DATE]
      ,ra.[LAST_LETTER_PRINTED]
      ,ra.[LAST_LETTER_PRINTED_DATE]
      ,ra.[HEADER_NOTE]
      ,ra.[UPDATE_DATE]
      ,ra.[UPDATE_TYPE]
      ,ra.[UPDATE_ID]
      ,ra.[FLAGS]
      ,ra.[LAST_PMT_AMT]
      ,ra.[REPORT_TO_BUREAU]
      ,ra.[BUR_UPDATE_DATE]
      ,ra.[BUR_UPDATE_TIME]
      ,ra.[BUR_STATUS]
      ,ra.[BUR_DISPUTE_STATUS]
      ,ra.[BUR_BKT_STATUS]
      ,ra.[BUR_SPECIAL_STATUS]
      ,ra.[BUR_STATUS_DATE]
      ,ra.[SCORE_STRATEGY]
      ,ra.[CREDIT_SCORE]
      ,ra.[BEHAVIOR_SCORE]
      ,ra.[PurchaseDate]
      ,ra.[PutbackDeadline]
      ,ra.[Putback]
      ,ra.[PutbackDate]
      ,ra.[SoldTo]
      ,ra.[Sold]
      ,ra.[SoldDate]
      ,ra.[Buyback]
      ,ra.[BuybackDate]
      ,ra.[PreviousOwner]
      ,ra.[PreviousAcct]
      ,ra.[OriginalBalance]
      ,ra.[OriginalPrincipal]
      ,ra.[OriginalInterest]
      ,ra.[Originator]
      ,ra.[OriginalAccount]
      ,ra.[oLastPayDate]
      ,ra.[oLastPayAmt]
      ,ra.[Client]
      ,ra.[ClientAccount]
      ,ra.[cLastPayDate]
      ,ra.[cLastPayAmt]
      ,ra.[Commission]
      ,ra.[Seller]
      ,ra.[SellerAccount]
      ,ra.[sLastPayDate]
      ,ra.[sLastPayAmt]
      ,ra.[Bankrupt]
      ,ra.[POE]
      ,ra.[Stage]
      ,ra.[Legal]
      ,ra.[LegalReject]
      ,ra.[PreLegalReject]
      ,ra.[Note]
      ,ra.[RetailVendor]
      ,ra.[WIP]
      ,ra.[WIPDate]
      ,ra.[PortfolioID]
      ,ra.[User1]
      ,ra.[User2]
      ,ra.[User3]
      ,ra.[User4]
      ,ra.[User5]
      ,ra.[User6]
      ,ra.[User7]
      ,ra.[User8]
      ,ra.[User9]
      ,ra.[User10]
      ,ra.[LastChargeDate]
      ,ra.[LastChargeAmt]
      ,ra.[DateOfOccur]
      ,ra.[YearsSinceLastActivity]
      ,ra.[CreateDate]
      ,ra.[FileID]
      ,ra.[LastCashAdvance]
      ,ra.[LastCashAdvanceAmt]
      ,ra.[LastPDCDate]
      ,ra.[LastPDCAmount]
      ,ra.[insight_score]
      ,ra.[FieldParse]
      ,ra.[Archive]
      ,ra.[Purge]
      ,ra.[MonthlyPayment]
      ,ra.[Terms]
      ,ra.[MatureDate]
      ,ra.[ScriptID]
      ,ra.[StartingPayments]
      ,ra.[StartingPaymentAmount]
      ,ra.[PaymentPlanDate]
      ,ra.[LAST_LETTER_CODE]
      ,ra.[LAST_LETTER_DATE]
      ,ra.[MEDIA_FLAG]
      ,ra.[OriginalInterestDate]
      ,ra.[ClientID]
      ,ra.[CollectorCommission]
      ,ra.[User11]
      ,ra.[User12]
      ,ra.[User13]
      ,ra.[User14]
      ,ra.[User15]
      ,ra.[User16]
      ,ra.[User17]
      ,ra.[User18]
      ,ra.[User19]
      ,ra.[User20]
      ,ra.[LastCCDDate]
      ,ra.[LastCCDAmount]
      ,ra.[LastPRMDate]
      ,ra.[LastPRMAmount]
      ,ra.[DateLastPRMEntered]
      ,ra.[FileNo]
      ,ra.[Forw_File]
      ,ra.[Masco_File]
      ,ra.[Forw_ID]
      ,ra.[Firm_ID]
      ,ra.[AssignDate]
      ,ra.[CheckFeeType]
      ,ra.[CreditCardFeeType]
      ,ra.[CheckFee]
      ,ra.[CreditCardFee]
      ,ra.[Claim_Date]
      ,ra.[Law_List]
      ,ra.[sFee]
      ,ra.[Rate_Pre]
      ,ra.[Rates_Post]
      ,ra.[CreditorName]
      ,ra.[CreditorName2]
      ,ra.[CreditorStreet]
      ,ra.[CreditorCS]
      ,ra.[CreditorZip]
      ,ra.[Debt_Bal]
      ,ra.[Debtor_No]
      ,ra.[Batch_No]
      ,ra.[SOL_Date]
      ,ra.[TU_Score]
      ,ra.[PimsLoadDate]
      ,ra.[Closed]
      ,ra.[DateClosed]
      ,ra.[LastTranCode]
      ,ra.[LastTranSource]
      ,ra.[LastReturnCode]
      ,ra.[AnnualRateCodeID]
      ,ra.[LastMediaAttachDate]
      ,ra.[StatuteTypeID]
      ,ra.[RestrictedAccount]
      ,ra.[Previous_WorkStatusID]
      ,ra.[WorkStatusID_ChangeDate]
      ,ra.[WorkStatusID_UpdateID]
      ,ra.[CitationCount]
      ,ra.[DONOTACH]
      ,ra.[Liquidation]
      ,ra.[AgencyAccount]
      ,ra.[PurchasePrice]
      ,ra.[SalesPrice]
  FROM [dbo].[RACCOUNT] ra 
  LEFT JOIN [dbo].[RACCTREL] rel ON rel.Account = ra.[ACCOUNT]
  LEFT JOIN [dbo].[RAGENCY] rAgc ON rAgc.[AGENCY_ID] = ra.[RESPONSIBILITY]
  LEFT JOIN [dbo].[RPRODCDE] rProd ON rProd.PRODUCT_CODE = ra.[PRODUCT_CODE] 
  LEFT JOIN [dbo].[RSTATUS] rStat ON rStat.[STATUS] = ra.[STATUS]
  LEFT JOIN [dbo].[WorkStatus] wStat ON wStat.WorkStatusID = ra.WorkStatusID
GO


GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spAccountSearch]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[MSI_spAccountSearch]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spBasicSearch]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[MSI_spBasicSearch]
GO

Create Procedure [dbo].[MSI_spBasicSearch]
  @name VARCHAR(255)
AS
  SET @name = @name + '%';
  Select * From MSI_vwSearch
  Where Name LIKE @name;
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spAdvanceSearch]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[MSI_spAdvanceSearch]
GO

Create Procedure [dbo].[MSI_spAdvanceSearch]
	@originator VARCHAR(51) = NULL,
	@accountNumber VARCHAR(20) = NULL,
	@seller VARCHAR(255) = NULL,
	@ssnFourDigits NVARCHAR(5) = NULL
AS
	DECLARE @sqlQry VARCHAR(MAX);
	DECLARE @selectClause VARCHAR(1000);
	DECLARE @whereClause VARCHAR(MAX);
	DECLARE @isANDReq bit;
	
	SET @isANDReq = 0;

	SET @selectClause = 'Select * FROM MSI_vwSearch search '
	SET @whereClause = 'Where ';

	IF @originator IS NOT NULL
	BEGIN
		SET @whereClause = @whereClause + ' search.Originator LIKE ''' + @originator + '%'''
		SET @isANDReq = 1
	END
	
	IF @accountNumber IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd

		
		SET @whereClause = @whereClause + ' search.Account = ' + @accountNumber
		SET @isANDReq = 1
	END

	
	IF @seller IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		
		SET @whereClause = @whereClause + ' search.Seller LIKE ''' + @seller + '%'''
		SET @isANDReq = 1
	END
	
	IF @ssnFourDigits IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		SET @whereClause = @whereClause + ' search.SSN LIKE ''' + '%' + @ssnFourDigits + '''';
		SET @isANDReq = 1
	END
	
	SET @sqlQry = @selectClause + @whereClause;

	PRINT @sqlQry;

	EXECUTE(@sqlQry);
GO

