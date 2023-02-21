/****** Script for extracting useful data from SSMS  ******/
/****** Extracted customer related information from this code  ******/


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
  CustomerKey;
  
  
  
  /****** Extracted product related information from this code  ******/
   /****** Used inner join to extract Product category and product sub category from another table ******/
  
 SELECT 
  p.[ProductKey], 
  pc.EnglishProductCategoryName as 'product_category' --,p.[ProductSubcategoryKey]
  , 
  ps.EnglishProductSubcategoryName as 'product_sub_category' --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  , 
  p.[EnglishProductName] --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  , 
  p.[FinishedGoodsFlag], 
  p.[Color], 
  p.[SafetyStockLevel], 
  p.[ReorderPoint], 
  p.[ListPrice], 
  p.[Size] as product_size --,[SizeRange]
  , 
  p.[Weight] as product_weight, 
  p.[DaysToManufacture] --,[ProductLine]
  --,[DealerPrice]
  --,[Class]
  --,[Style]
  --,[ModelName]
  --,[LargePhoto]
  --,[StartDate]
  --,[EndDate]
  , 
  isnull(Status,'Outdated')as status
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as p 
  join [AdventureWorksDW2019].[dbo].[DimProductSubCategory] as ps on p.ProductSubcategoryKey = ps.ProductSubcategoryKey 
  join [AdventureWorksDW2019].[dbo].[DimProductCategory] as pc on ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductAlternateKey asc;
  
  
  /****** Extracted Date related information from this code  ******/
  
  SELECT [DateKey]
      ,[FullDateAlternateKey] as Date
      ,[DayNumberOfWeek] as WeekDay
      ,[EnglishDayNameOfWeek] as Day
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[DayNumberOfYear]
      ,[WeekNumberOfYear] as WeekNo
      ,[EnglishMonthName]
      --,[SpanishMonthName]
      --,[FrenchMonthName]
      ,[MonthNumberOfYear] as MonthNo
      ,[CalendarQuarter] as Quarter
      ,[CalendarYear] as Year
      --,[CalendarSemester]
      --,[FiscalQuarter]
      --,[FiscalYear]
      --,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  where CalendarYear>=2019;
  
  
  /****** Extracted Fact table/ numerical data  for proper analysis in power bi  ******/
  
  SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      --,[SalesOrderLineNumber]
      --,[RevisionNumber]
      --,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
      --,[DiscountAmount]
      --,[ProductStandardCost]
      --,[TotalProductCost]
      ,[SalesAmount]
      --,[TaxAmt]
     -- ,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
     -- ,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  where year(OrderDate)>=2019
  order by ProductKey;
