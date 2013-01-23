SELECT Account,Portfolio,PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,OriginalBalance As FaceValue,PurchaseDate,PurchaseDate As CutOffDate
FROM vwAccounts
WHERE PRODUCT_CODE = 'GMC002';

SELECT 
Count(Account), PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,SUM(OriginalBalance) As FaceValue,PurchaseDate
FROM vwAccounts WHERE PRODUCT_CODE = 'GMC002'
Group by PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice,PurchaseDate;


SELECT 
Count(Account) #OfAccounts,PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice As CostBasis,SUM(OriginalBalance) As FaceValue,PurchaseDate
INTO #tmpPortfolioData
FROM vwAccounts WHERE PRODUCT_CODE = 'GMC002'
Group by PRODUCT_CODE,PortfolioOwner,Seller,PurchasePrice,PurchaseDate;

Select Sum(#OfAccounts),PRODUCT_CODE, PortfolioOwner,Seller,Avg(CostBasis)As  CostBasis,SUM(FaceValue) As FaceValue,PurchaseDate
From #tmpPortfolioData
Group By PRODUCT_CODE,PortfolioOwner,Seller,PurchaseDate;
DROP Table #tmpPortfolioData;

EXEC sp_GetPortfolioPurchaseSummary 'GMC002'
select distinct seller from RACCOUNT
-------------------------------------------------------------------------------------------------------
SELECT Portfolio,PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice As SalesBasis,OriginalBalance As FaceValue,SoldDate
FROM vwAccounts
WHERE PRODUCT_CODE = 'GMC002';

SELECT PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice As SalesBasis,Sum(OriginalBalance) As FaceValue,SoldDate
FROM vwAccounts
WHERE PRODUCT_CODE = 'GMC002'
Group By PRODUCT_CODE,RESPONSIBILITY,Seller,SalesPrice,SoldDate