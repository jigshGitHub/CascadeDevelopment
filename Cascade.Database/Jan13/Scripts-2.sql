
/****** Object:  Table [dbo].[MSI_Port_SalesTrans_Original]    Script Date: 01/26/2013 13:25:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_Port_SalesTrans_Original]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_Port_SalesTrans_Original]
GO
/****** Object:  Table [dbo].[MSI_Port_SalesTrans_Original]    Script Date: 01/26/2013 13:25:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MSI_Port_SalesTrans_Original](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Portfolio#] [nvarchar](255) NULL,
	[Cut-OffDate] [datetime] NULL,
	[ClosingDate] [datetime] NULL,
	[Lender] [nvarchar](255) NULL,
	[Buyer] [nvarchar](255) NULL,
	[SalesPrice] [money] NULL,
	[SalesBasis] [float] NULL,
	[FaceValue] [money] NULL,
	[#ofAccts] [float] NULL,
	[PutbackTerm(days)] [float] NULL,
	[PutbackDeadline] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[MSI_Port_SalesTrans_Edited]    Script Date: 01/26/2013 13:25:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_Port_SalesTrans_Edited]') AND type in (N'U'))
DROP TABLE [dbo].[MSI_Port_SalesTrans_Edited]
GO
/****** Object:  Table [dbo].[MSI_Port_SalesTrans_Edited]    Script Date: 01/26/2013 13:25:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MSI_Port_SalesTrans_Edited](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Portfolio#] [nvarchar](255) NULL,
	[Cut-OffDate] [datetime] NULL,
	[ClosingDate] [datetime] NULL,
	[Lender] [nvarchar](255) NULL,
	[Buyer] [nvarchar](255) NULL,
	[SalesPrice] [money] NULL,
	[SalesBasis] [float] NULL,
	[FaceValue] [money] NULL,
	[#ofAccts] [float] NULL,
	[PutbackTerm(days)] [float] NULL,
	[PutbackDeadline] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  StoredProcedure [dbo].[sp_GetPortfolioSalesSummary]    Script Date: 01/24/2013 06:00:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPortfolioSalesSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPortfolioSalesSummary]
GO


CREATE Procedure [dbo].[sp_GetPortfolioSalesSummary](
@productCode VARCHAR(6)
)
AS



SELECT PRODUCT_CODE AS Portfolio#, SoldDate AS [Cut-OffDate],'' As [ClosingDate],'' As Lender,RESPONSIBILITY As Buyer,(Sum(OriginalBalance) * AVG(SalesPrice)) As SalesPrice, AVG(SalesPrice) As SalesBasis,Sum(OriginalBalance) As FaceValue,Count(Account) As #ofAccts,'' As [PutbackTerm], '' As [PutbackDeadline], '' As Notes
FROM vwAccounts
WHERE PRODUCT_CODE = @productCode
Group By PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice,SoldDate

GO


/****** Object:  StoredProcedure [dbo].[MSI_sp_GetDistinctResponsibility]    Script Date: 01/26/2013 22:12:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_sp_GetDistinctResponsibility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_sp_GetDistinctResponsibility]
GO


/****** Object:  StoredProcedure [dbo].[MSI_sp_GetDistinctResponsibility]    Script Date: 01/26/2013 22:12:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[MSI_sp_GetDistinctResponsibility]
As
Select Distinct RESPONSIBILITY from vwAccounts
GO

