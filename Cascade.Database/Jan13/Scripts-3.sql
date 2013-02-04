--Executed on 139/dbpcs on 2/3 @4:00PM
/****** Object:  Table [dbo].[MSI_ComplaintMain]    Script Date: 01/30/2013 15:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_ComplaintMain]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_ComplaintMain]
GO

/****** Object:  Table [dbo].[MSI_ComplaintMain]    Script Date: 01/30/2013 15:32:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MSI_ComplaintMain](
	[AgencyId] [varchar](20) NULL,
	[Account] [varchar](20) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Address] [varchar](500) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](10) NULL,
	[HomePhone] [varchar](50) NULL,
	[WorkPhone] [varchar](50) NULL,
	[MobilePhone] [varchar](50) NULL,
	[LastFourSSN] [varchar](4) NOT NULL,
	[DebtorIdentityVerified] [bit] NULL,
	[ContactMethodId] [int] NULL,
	[ContactTimeId] [int] NULL,
	[CreditorName] [varchar](500) NULL,
	[DebtProductId] [int] NULL,
	[DebtPurchaseBalance] [varchar](50) NULL,
	[DebtCurrentBalance] [varchar](50) NULL,
	[DisputeDebt] [bit] NULL,
	[DisputeDebtAmount] [bit] NULL,
	[DisputeDebtDueDate] [bit] NULL,
	[ComplaintID] [varchar](50) NULL,
	[ComplaiintDate] [datetime] NOT NULL,
	[ComplaintReceivedByMethodId] [int] NULL,
	[ComplaintIssueId] [int] NOT NULL,
	[ComplaintNotes] [varchar](1000) NULL,
	[ComplaintSubmitedToAgency] [bit] NULL,
	[ComplaintSubmitedToAgencyDate] [datetime] NULL,
	[MoreInfoReqdFromDebtor] [bit] NULL,
	[MoreInfoRequestedDate] [datetime] NULL,
	[MoreInfoRequested] [varchar](1000) NULL,
	[MoreInfoReceivedFromDebtor] [bit] NULL,
	[MoreInfoReceivedDate] [datetime] NULL,
	[MoreInfoReceived] [varchar](1000) NULL,
	[ComplaintSubmittedToOwner] [bit] NULL,
	[ComplaintSubmittedDate] [datetime] NULL,
	[TimeToSubmitDays] [int] NULL,
	[MoreInfoFromAgency] [bit] NULL,
	[MoreInfoFromAgencyRequestedDate] [datetime] NULL,
	[MoreInfoFromAgencyRequested] [varchar](1000) NULL,
	[MoreInfoFromAgencyReceived] [varchar](1000) NULL,
	[MoreInfoFromAgencyReceivedDate] [datetime] NULL,
	[OwnerResponseId] [int] NULL,
	[OwnerResponseDate] [datetime] NULL,
	[OwnerResponseDays] [int] NULL,
	[AgencyResponseToDebtorDate] [datetime] NULL,
	[TotalResponseTimeDays] [int] NULL,
	[DebotrAgree] [bit] NULL,
	[NeedFurtherAction] [bit] NULL,
	[FinalActionStepId] [int] NULL,
	[IsViewedByOwner] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_MSI_ComplaintMain] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[MSI_DebtorContactMethods]    Script Date: 02/02/2013 22:40:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_DebtorContactMethods]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_DebtorContactMethods]
GO
/****** Object:  Table [dbo].[MSI_DebtorContactTime]    Script Date: 02/02/2013 22:40:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_DebtorContactTime]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_DebtorContactTime]
GO
/****** Object:  Table [dbo].[MSI_DebtorProducts]    Script Date: 02/02/2013 22:40:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_DebtorProducts]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_DebtorProducts]
GO
/****** Object:  Table [dbo].[MSI_DebtorProducts]    Script Date: 02/02/2013 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_DebtorProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_DebtorProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_DebtorProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_DebtorProducts] ON
INSERT [dbo].[MSI_DebtorProducts] ([Id], [Product]) VALUES (1, N'Credit Card')
INSERT [dbo].[MSI_DebtorProducts] ([Id], [Product]) VALUES (2, N'Automobile')
INSERT [dbo].[MSI_DebtorProducts] ([Id], [Product]) VALUES (3, N'Mortgage')
SET IDENTITY_INSERT [dbo].[MSI_DebtorProducts] OFF
/****** Object:  Table [dbo].[MSI_DebtorContactTime]    Script Date: 02/02/2013 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_DebtorContactTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_DebtorContactTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Time] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_DebtorContactTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_DebtorContactTime] ON
INSERT [dbo].[MSI_DebtorContactTime] ([Id], [Time]) VALUES (1, N'Morning Only')
INSERT [dbo].[MSI_DebtorContactTime] ([Id], [Time]) VALUES (2, N'Afternoon Only')
INSERT [dbo].[MSI_DebtorContactTime] ([Id], [Time]) VALUES (3, N'Daytime Only')
INSERT [dbo].[MSI_DebtorContactTime] ([Id], [Time]) VALUES (4, N'Evening Only')
INSERT [dbo].[MSI_DebtorContactTime] ([Id], [Time]) VALUES (5, N'Weekend Only')
SET IDENTITY_INSERT [dbo].[MSI_DebtorContactTime] OFF
/****** Object:  Table [dbo].[MSI_DebtorContactMethods]    Script Date: 02/02/2013 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_DebtorContactMethods]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_DebtorContactMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Method] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_DebtorContactMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_DebtorContactMethods] ON
INSERT [dbo].[MSI_DebtorContactMethods] ([Id], [Method]) VALUES (1, N'Home Phone')
INSERT [dbo].[MSI_DebtorContactMethods] ([Id], [Method]) VALUES (2, N'Work Phone')
INSERT [dbo].[MSI_DebtorContactMethods] ([Id], [Method]) VALUES (3, N'Cell Phone')
SET IDENTITY_INSERT [dbo].[MSI_DebtorContactMethods] OFF

/****** Object:  Table [dbo].[MSI_ComplaintIssues]    Script Date: 02/02/2013 23:05:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_ComplaintIssues]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_ComplaintIssues]
GO
/****** Object:  Table [dbo].[MSI_ComplaintReceviedBy]    Script Date: 02/02/2013 23:05:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_ComplaintReceviedBy]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_ComplaintReceviedBy]
GO
/****** Object:  Table [dbo].[MSI_FinalActionsteps]    Script Date: 02/02/2013 23:05:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_FinalActionsteps]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_FinalActionsteps]
GO
/****** Object:  Table [dbo].[MSI_OwnerResponses]    Script Date: 02/02/2013 23:05:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_OwnerResponses]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_OwnerResponses]
GO
/****** Object:  Table [dbo].[MSI_OwnerResponses]    Script Date: 02/02/2013 23:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_OwnerResponses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_OwnerResponses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Response] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_OwnerResponses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_OwnerResponses] ON
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (1, N'Closed')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (2, N'Closed with explanation')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (3, N'Closed with monetary relief')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (4, N'Closed with non-monetary relief')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (5, N'Closed with relief')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (6, N'Closed without relief')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (7, N'In Progress')
INSERT [dbo].[MSI_OwnerResponses] ([Id], [Response]) VALUES (8, N'Untimely response')
SET IDENTITY_INSERT [dbo].[MSI_OwnerResponses] OFF
/****** Object:  Table [dbo].[MSI_FinalActionsteps]    Script Date: 02/02/2013 23:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_FinalActionsteps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_FinalActionsteps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Step] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_FinalActionsteps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_FinalActionsteps] ON
INSERT [dbo].[MSI_FinalActionsteps] ([Id], [Step]) VALUES (1, N'Review with Owner')
INSERT [dbo].[MSI_FinalActionsteps] ([Id], [Step]) VALUES (2, N'Submit another complaint')
INSERT [dbo].[MSI_FinalActionsteps] ([Id], [Step]) VALUES (3, N'Close with disagreement noted')
SET IDENTITY_INSERT [dbo].[MSI_FinalActionsteps] OFF
/****** Object:  Table [dbo].[MSI_ComplaintReceviedBy]    Script Date: 02/02/2013 23:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_ComplaintReceviedBy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_ComplaintReceviedBy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Media] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_ComplaintReceviedBy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_ComplaintReceviedBy] ON
INSERT [dbo].[MSI_ComplaintReceviedBy] ([Id], [Media]) VALUES (1, N'Phone')
INSERT [dbo].[MSI_ComplaintReceviedBy] ([Id], [Media]) VALUES (2, N'Fax')
INSERT [dbo].[MSI_ComplaintReceviedBy] ([Id], [Media]) VALUES (3, N'Email')
INSERT [dbo].[MSI_ComplaintReceviedBy] ([Id], [Media]) VALUES (4, N'Postal Mail')
SET IDENTITY_INSERT [dbo].[MSI_ComplaintReceviedBy] OFF
/****** Object:  Table [dbo].[MSI_ComplaintIssues]    Script Date: 02/02/2013 23:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_ComplaintIssues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_ComplaintIssues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MSI_ComplaintIssues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_ComplaintIssues] ON
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (1, N'Advertising & marketing')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (2, N'Application processing delay')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (3, N'APR or interest rate')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (4, N'Arbitration')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (5, N'Balance transfer')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (6, N'Balance transfer fee')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (7, N'Bankruptcy')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (8, N'Billing disputes')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (9, N'Billing statement')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (10, N'Closing/Cancelling account')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (11, N'Collection debt dispute')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (12, N'Collection practices')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (13, N'Credit card/debt protection')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (14, N'Credit determination')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (15, N'Credit reporting')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (16, N'Customer service')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (17, N'Customer relations')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (18, N'Delinquent account')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (19, N'Forbearance')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (20, N'Identity theft / fraud')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (21, N'Late fee')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (22, N'Other')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (23, N'Over limit fee')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (24, N'Payoff process')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (25, N'Privacy')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (26, N'Sale of account')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (27, N'Transaction issue')
INSERT [dbo].[MSI_ComplaintIssues] ([Id], [Name]) VALUES (28, N'Unsolicited issuance of credit card')
SET IDENTITY_INSERT [dbo].[MSI_ComplaintIssues] OFF

/****** Object:  View [dbo].[MSI_vwDebtors]    Script Date: 02/02/2013 23:07:35 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MSI_vwDebtors]'))
DROP VIEW [dbo].[MSI_vwDebtors]
GO

/****** Object:  View [dbo].[MSI_vwDebtors]    Script Date: 02/02/2013 23:07:35 ******/
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
,vwAcc.TOT_DUE_AMT As DebtCurrentBalance
,vwAcc.Balance As DebtorPurchaseBalance
,vwAcc.CreditorName
From vwAccounts vwAcc INNER JOIN RACCOUNT rAcc ON vwAcc.ACCOUNT = rAcc.ACCOUNT
GO

/****** Object:  StoredProcedure [dbo].[MSI_spGetDebtors]    Script Date: 02/02/2013 23:11:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_spGetDebtors]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_spGetDebtors]
GO


/****** Object:  StoredProcedure [dbo].[MSI_spGetDebtors]    Script Date: 02/02/2013 23:11:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[MSI_spGetDebtors]
(
	@pimsAccountNumber VARCHAR(20)
	)
	As
	Select * From MSI_vwDebtors
	Where Account Like @pimsAccountNumber + '%';
GO


/****** Object:  Table [dbo].[MSI_USStates]    Script Date: 02/03/2013 10:17:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_USStates]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_USStates]
GO
/****** Object:  Table [dbo].[MSI_USStates]    Script Date: 02/03/2013 10:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_USStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MSI_USStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Value] [varchar](2) NULL,
 CONSTRAINT [PK_MSI_USStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MSI_USStates] ON
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (1, N'Virginia', N'VA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (2, N'Texas', N'TX')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (3, N'Ohio', N'OH')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (4, N'Maryland', N'MD')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (5, N'West Virginia', N'WV')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (6, N'New York', N'NY')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (7, N'Nevada', N'NV')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (8, N'California', N'CA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (9, N'Alabama', N'AL')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (10, N'Alaska', N'AK')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (11, N'Arizona', N'AZ')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (12, N'Arkansas', N'AS')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (13, N'Colorado', N'CO')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (14, N'Connecticut', N'CT')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (15, N'Delaware', N'DE')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (16, N'Florida', N'FL')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (17, N'Georgia', N'GA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (18, N'Hawaii', N'HW')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (19, N'Idaho', N'ID')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (20, N'Illinois', N'IL')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (21, N'Indiana', N'IN')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (22, N'Iowa', N'IA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (23, N'Kansas', N'KS')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (24, N'Kentuky', N'KY')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (25, N'Louisiana', N'LN')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (26, N'Maine', N'MN')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (27, N'Massachusetts', N'MA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (28, N'Michigan', N'MI')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (29, N'Minnesota', N'MN')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (30, N'Mississippi', N'MS')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (31, N'Missouri', N'MI')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (32, N'Montana', N'MO')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (33, N'Nebraska', N'NA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (34, N'New Hampshire', N'NH')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (35, N'New Jersey', N'NJ')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (36, N'New Mexico', N'NM')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (37, N'North Carolina', N'NC')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (38, N'North Dakota', N'ND')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (39, N'Oklahoma', N'OK')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (40, N'Oregon', N'OR')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (41, N'Pennsylvania', N'PA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (42, N'Rhode Island', N'RI')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (43, N'South Carolina', N'SC')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (44, N'South Dakota', N'SD')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (45, N'Tennessee', N'TN')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (46, N'Utah', N'UT')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (47, N'Vermont', N'VT')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (48, N'Washington', N'WA')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (49, N'Wisconsin', N'WI')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (50, N'Wyoming', N'WY')
INSERT [dbo].[MSI_USStates] ([Id], [Name], [Value]) VALUES (51, N'District Of Columbia', N'DC')
SET IDENTITY_INSERT [dbo].[MSI_USStates] OFF
