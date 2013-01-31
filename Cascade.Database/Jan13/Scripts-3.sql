
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
 CONSTRAINT [PK_MSI_ComplaintMain] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

