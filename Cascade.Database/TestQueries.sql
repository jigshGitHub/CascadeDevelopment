--sale transactions with Agency Text
SELECT c.Name, t.*
  FROM [CascadeDB].[dbo].Port_Trans t left join [CascadeDB].[dbo].[Sup_Company] c on c.Agency = t.Inv_AgencyName
   Where TransType='sale' AND Portfolio#='B10003';
--collection transactions with Agency Text
SELECT c.Name, t.*
  FROM [CascadeDB].[dbo].Port_Trans t left join [CascadeDB].[dbo].[Sup_Company] c on c.Agency = t.Inv_AgencyName
   Where TransType='collection' AND Portfolio#='B10003';
--investment transactions with Agency Text
SELECT c.Name, t.*
  FROM [CascadeDB].[dbo].Port_Trans t left join [CascadeDB].[dbo].[Sup_Company] c on c.Agency = t.Inv_AgencyName
   Where TransType='investment' AND Portfolio#='B10003';
   
   --distribution transactions with Agency Text
SELECT c.Name, t.*
  FROM [CascadeDB].[dbo].Port_Trans t left join [CascadeDB].[dbo].[Sup_Company] c on c.Agency = t.Inv_AgencyName
   Where TransType='distribution' AND Portfolio#='B10001';
   
      
   --interest transactions with Agency Text
SELECT c.Name, t.*
  FROM [CascadeDB].[dbo].Port_Trans t left join [CascadeDB].[dbo].[Sup_Company] c on c.Agency = t.Inv_AgencyName
   Where TransType='interest' AND Portfolio#='LC0004';