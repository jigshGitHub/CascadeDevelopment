SELECT acc.ACCOUNT, 
acc.FirstName
,acc.LastName
,acc.ADDRESS1
,acc.ADDRESS2
,acc.CITY
,acc.[STATE]
,acc.ZIP_CODE
,acc.ZIP
,acc.SSN
,acc.SS_NO
,acc.PHONE_CELL
,acc.PHONE_HOME
,acc.PHONE_WORK
,acc.DOB
,racc.Debt_Bal As DebtCurrentBalance
,(racc.OriginalBalance * racc.PurchasePrice) As DebtPurchaseBalance
From vwAccounts acc INNER JOIN RACCOUNT rAcc ON acc.ACCOUNT = rAcc.ACCOUNT
Where acc.ACCOUNT like '50000218%'