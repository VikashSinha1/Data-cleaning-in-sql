/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  c.[CustomerKey] --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  , 
  c.[FirstName] --,[MiddleName]
  , 
  c.[LastName], 
  c.FirstName + ' ' + c.LastName as 'Full_Name' --,[NameStyle]
  , 
  c.[BirthDate] --,[MaritalStatus]
  --,[Suffix]
  , 
  case gender when 'M' THEN 'Male' else 'Female' end as 'Gender' --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  -- ,[FrenchEducation]
  --,[EnglishOccupation]
  -- ,[SpanishOccupation]
  -- ,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  -- ,[AddressLine1]
  -- ,[AddressLine2]
  -- ,[Phone]
  , 
  c.[DateFirstPurchase], 
  g.City --,[CommuteDistance],
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] c 
  join dbo.DimGeography g on c.GeographyKey = g.GeographyKey --joined geography table to extract city out of it
order by 
  CustomerKey