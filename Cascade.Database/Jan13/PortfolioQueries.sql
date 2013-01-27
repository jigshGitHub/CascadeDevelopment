SELECT Account,Portfolio,PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,OriginalBalance As FaceValue,PurchaseDate,PurchaseDate As CutOffDate
FROM vwAccounts
WHERE PRODUCT_CODE = 'GMC002';

SELECT 
Count(Account), PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,SUM(OriginalBalance) As FaceValue,PurchaseDate,'' As Note
FROM vwAccounts WHERE PRODUCT_CODE = 'GMC002'
Group by PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice,PurchaseDate;


SELECT 
Count(Account) #OfAccounts,PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,SUM(OriginalBalance) As FaceValue,PurchaseDate,'' As Note
INTO #tmpPortfolioData
FROM vwAccounts WHERE PRODUCT_CODE = 'GMC002'
Group by PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice,PurchaseDate;

Select Sum(#OfAccounts),PRODUCT_CODE, PortfolioOwner,Seller,Avg(CostBasis)As  CostBasis,SUM(FaceValue) As FaceValue,PurchaseDate,'' As Note
From #tmpPortfolioData
Group By PRODUCT_CODE,PortfolioOwner,Seller,PurchaseDate;
DROP Table #tmpPortfolioData;

EXEC sp_GetPortfolioPurchaseSummary 'GMC002'
-------------------------------------------------------------------------------------------------------
SELECT Portfolio,PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice As SalesBasis,OriginalBalance As FaceValue,SoldDate
FROM vwAccounts
WHERE PRODUCT_CODE = 'GMC003' 
--ANd RESPONSIBILITY = 'ARCHES'

SELECT PRODUCT_CODE AS Portfolio#, SoldDate AS [Cut-OffDate],'' As [ClosingDate],'' As Lender,RESPONSIBILITY As Buyer,Seller,(Sum(OriginalBalance) * AVG(SalesPrice)) As SalesPrice, AVG(SalesPrice) As SalesBasis,Sum(OriginalBalance) As FaceValue,Count(Account) As #ofAccts,'' As [PutbackTerm(days)], '' As [PutbackDeadline], '' As Notes
FROM vwAccounts
WHERE PRODUCT_CODE = 'GMC003' 
--ANd RESPONSIBILITY = 'ARCHES'
Group By PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice,SoldDate

EXEC sp_GetPortfolioSalesSummary 'GMC002'