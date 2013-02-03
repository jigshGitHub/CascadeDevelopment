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
Where vwAcc.ACCOUNT like '50000218%'

exec [MSI_spGetDebtors] '500002184'