USE [CascadeDB]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_ResaleRestriction]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_ResaleRestriction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MSI_ResaleRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NULL,
	[Restriction] [varchar](500) NULL,
 CONSTRAINT [PK_MSI_ResaleRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO MSI_ResaleRestriction (Value, Restriction) VALUES(1,'No Approval Required');
INSERT INTO MSI_ResaleRestriction (Value, Restriction) VALUES(2,'Approval Required');
INSERT INTO MSI_ResaleRestriction (Value, Restriction) VALUES(3,'Notice Required');

/****** Object:  StoredProcedure [dbo].[sp_GetPortfolioPurchaseSummary]    Script Date: 01/19/2013 08:46:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPortfolioPurchaseSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPortfolioPurchaseSummary]
GO

Create Procedure [dbo].[sp_GetPortfolioPurchaseSummary](
@productCode VARCHAR(6)
)
AS

SELECT 
Count(Account) #OfAccounts,PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,SUM(OriginalBalance) As FaceValue,PurchaseDate
INTO #tmpPortfolioData
FROM vwAccounts WHERE PRODUCT_CODE = @productCode
Group by PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice,PurchaseDate;

Select Sum(#OfAccounts) As #OfAccounts,PRODUCT_CODE, PortfolioOwner,Seller,Avg(CostBasis)As  CostBasis,SUM(FaceValue) As FaceValue,PurchaseDate
From #tmpPortfolioData
Group By PRODUCT_CODE,PortfolioOwner,Seller,PurchaseDate;
DROP Table #tmpPortfolioData;
GO


/****** Object:  Table [dbo].[MSI_Port_Acq_Original]    Script Date: 01/19/2013 08:56:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_Port_Acq_Original]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_Port_Acq_Original]
GO


/****** Object:  Table [dbo].[MSI_Port_Acq_Original]    Script Date: 01/19/2013 08:56:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MSI_Port_Acq_Original](
	[Portfolio#] [nvarchar](255) NOT NULL,
	[Cut-OffDate] [datetime] NULL,
	[ClosingDate] [datetime] NULL,
	[Lender/FileDescription] [nvarchar](255) NULL,
	[Seller] [nvarchar](255) NULL,
	[CostBasis] [float] NULL,
	[Face] [money] NULL,
	[PurchasePrice] [money] NULL,
	[#ofAccts] [float] NULL,
	[PutbackTerm (days)] [int] NULL,
	[PutbackDeadline] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[ResaleRestrictionId] [int] NULL,
	[Company] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Portfolio#] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[MSI_Port_Acq_Edited]    Script Date: 01/23/2013 13:00:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_Port_Acq_Edited]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_Port_Acq_Edited]
GO


CREATE TABLE [dbo].[MSI_Port_Acq_Edited](
	[Portfolio#] [nvarchar](255) NOT NULL,
	[Cut-OffDate] [datetime] NULL,
	[ClosingDate] [datetime] NULL,
	[Lender/FileDescription] [nvarchar](255) NULL,
	[Seller] [nvarchar](255) NULL,
	[CostBasis] [float] NULL,
	[Face] [money] NULL,
	[PurchasePrice] [money] NULL,
	[#ofAccts] [float] NULL,
	[PutbackTerm (days)] [int] NULL,
	[PutbackDeadline] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[ResaleRestrictionId] [int] NULL,
	[Company] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Portfolio#] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

