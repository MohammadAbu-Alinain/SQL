-- question one --
select * from dbo.DimEmployee
order by Title asc

-- question two --
select ProductKey,ProductAlternateKey,EnglishProductName,StartDate,ProductLine from dbo.DimProduct
where StartDate is not null and ProductLine like 't%'

-- question three --
SELECT DimCustomer.CustomerKey, SUM(FactInternetSales.Freight) AS [total freight]
FROM     DimCustomer INNER JOIN
                  FactInternetSales ON DimCustomer.CustomerKey = FactInternetSales.CustomerKey
GROUP BY DimCustomer.CustomerKey
ORDER BY DimCustomer.CustomerKey

-- question four --
SELECT FactInternetSales.CustomerKey AS CustomerID, SUM(FactInternetSales.TotalProductCost) AS [sum subTotal], AVG(FactInternetSales.TotalProductCost) AS [avg subTotal], FactInternetSalesReason.SalesReasonKey
FROM     FactInternetSales INNER JOIN
                  FactInternetSalesReason ON FactInternetSales.SalesOrderNumber = FactInternetSalesReason.SalesOrderNumber AND FactInternetSales.SalesOrderLineNumber = FactInternetSalesReason.SalesOrderLineNumber
GROUP BY FactInternetSales.CustomerKey, FactInternetSalesReason.SalesReasonKey
ORDER BY CustomerID DESC

-- question five --
SELECT DISTINCT DimGeography.City, DimReseller.NumberEmployees AS seller_id, DimCustomer.FirstName AS cus_name
FROM     DimGeography INNER JOIN
                  DimCustomer ON DimGeography.GeographyKey = DimCustomer.GeographyKey INNER JOIN
                  DimReseller ON DimGeography.GeographyKey = DimReseller.GeographyKey

-- question six --
SELECT DimCustomer.CustomerKey, DimCustomer.FirstName, DimCustomer.EmailAddress, SUM(FactInternetSales.TotalProductCost) AS Total_price, AVG(DISTINCT FactInternetSales.TaxAmt) AS avg_tax, 
                  DimEmployee.FirstName AS Employee_Name, DimEmployee.EmailAddress AS Employee_Email, DimEmployee.EmployeeKey AS Employee_ID, COUNT(DISTINCT FactResellerSales.OrderQuantity) AS OrderQuantity
FROM     DimProduct INNER JOIN
                  FactInternetSales ON DimProduct.ProductKey = FactInternetSales.ProductKey INNER JOIN
                  FactResellerSales ON DimProduct.ProductKey = FactResellerSales.ProductKey INNER JOIN
                  DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey RIGHT OUTER JOIN
                  DimEmployee ON FactResellerSales.EmployeeKey = DimEmployee.EmployeeKey
GROUP BY DimCustomer.CustomerKey, DimCustomer.FirstName, DimCustomer.EmailAddress, DimEmployee.FirstName, DimEmployee.EmailAddress, DimEmployee.EmployeeKey

