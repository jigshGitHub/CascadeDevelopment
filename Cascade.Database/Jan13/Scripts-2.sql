--Executed on server 139/dbPCS
/****** Object:  StoredProcedure [dbo].[sp_GetDistinctProductCode]    Script Date: 01/28/2013 13:20:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDistinctProductCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetDistinctProductCode]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_sp_GetDistinctProductCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_sp_GetDistinctProductCode]
GO
/****** Object:  StoredProcedure [dbo].[MSI_sp_GetDistinctProductCode]    Script Date: 01/28/2013 13:20:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[MSI_sp_GetDistinctProductCode]
As
Select distinct Product_Code From RACCOUNT (nolock) Order By 1;


GO


/****** Object:  StoredProcedure [dbo].[sp_GetPortfolioPurchaseSummary]    Script Date: 01/28/2013 13:07:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPortfolioPurchaseSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPortfolioPurchaseSummary]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_sp_GetPortfolioPurchaseSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_sp_GetPortfolioPurchaseSummary]
GO

/****** Object:  StoredProcedure [dbo].[MSI_sp_GetPortfolioPurchaseSummary]    Script Date: 01/28/2013 13:07:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[MSI_sp_GetPortfolioPurchaseSummary](
@productCode VARCHAR(6)
)
AS

If Exists(Select [Portfolio#] From [MSI_Port_Acq_Original] Where [Portfolio#] = @productCode)
BEGIN
	Select [Portfolio#],[Cut-OffDate],[ClosingDate] ,[Lender/FileDescription] ,[Seller] ,[CostBasis] ,[Face] ,[PurchasePrice] ,[#ofAccts] ,[PutbackTerm (days)] As PutBackTerm ,[PutbackDeadline] ,[Notes] ,[ResaleRestrictionId] ,[Company]
	FROM [dbo].[MSI_Port_Acq_Original]
	Where [Portfolio#] = @productCode;
END
ELSE
BEGIN
	
	SELECT 
	Count(Account) #OfAccounts,PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,SUM(OriginalBalance) As FaceValue,PurchaseDate
	INTO #tmpPortfolioData
	FROM vwAccounts WHERE PRODUCT_CODE = @productCode
	Group by PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice,PurchaseDate;

	Select PRODUCT_CODE AS [Portfolio#],PurchaseDate AS [Cut-OffDate],'' As [ClosingDate], '' As [Lender/FileDescription],Seller,Avg(CostBasis)As  CostBasis,SUM(FaceValue) As Face, SUM(FaceValue) * Avg(CostBasis) As [PurchasePrice],Sum(#OfAccounts) As [#ofAccts],'' As PutBackTerm ,'' As[PutbackDeadline],'' As Notes,'' As [ResaleRestrictionId],PortfolioOwner As [Company]
	From #tmpPortfolioData
	Group By PRODUCT_CODE,PortfolioOwner,Seller,PurchaseDate;
	DROP Table #tmpPortfolioData;
END


GO


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
	[ID] [int] NOT NULL,
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
/****** Object:  StoredProcedure [dbo].[MSI_sp_GetPortfolioSalesSummary]    Script Date: 01/24/2013 06:00:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_sp_GetPortfolioSalesSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_sp_GetPortfolioSalesSummary]
GO


CREATE Procedure [dbo].[MSI_sp_GetPortfolioSalesSummary](
@productCode VARCHAR(6)
)
AS

If Not Exists(Select Top 1 [Portfolio#] From [MSI_Port_SalesTrans_Original] Where [Portfolio#] = @productCode)
BEGIN
	INSERT INTO MSI_Port_SalesTrans_Original(Portfolio#,[Cut-OffDate],Buyer,SalesPrice,SalesBasis,FaceValue,#ofAccts)
	SELECT PRODUCT_CODE, SoldDate,RESPONSIBILITY,(Sum(OriginalBalance) * AVG(SalesPrice)), AVG(SalesPrice),Sum(OriginalBalance),Count(Account)
	FROM vwAccounts
	WHERE PRODUCT_CODE = @productCode
	Group By PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice,SoldDate
END

SELECT [ID] ,[Portfolio#] ,[Cut-OffDate] ,[ClosingDate] ,[Lender] ,[Buyer] ,[SalesPrice] ,[SalesBasis] ,[FaceValue] ,[#ofAccts] ,[PutbackTerm(days)] As PutBackTerm ,[PutbackDeadline] ,[Notes]
FROM [dbo].[MSI_Port_SalesTrans_Original]
WHERE [Portfolio#] = @productCode

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

