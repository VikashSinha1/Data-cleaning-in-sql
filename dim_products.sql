/****** Script for SelectTopNRows command from SSMS  ******/
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
  p.ProductAlternateKey asc
