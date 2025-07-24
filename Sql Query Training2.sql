SELECT DISTINCT 
                  DimEmployee.EmployeeKey, DimEmployee.ParentEmployeeKey, DimEmployee.SalesTerritoryKey, DimEmployee.FirstName, DimEmployee.LastName, DimEmployee.MiddleName, DimEmployee.Title, DimEmployee.HireDate, 
                  DimEmployee.BirthDate, DimEmployee.LoginID, DimEmployee.EmailAddress, DimEmployee.Phone, DimEmployee.MaritalStatus, DimEmployee.EmergencyContactName, DimEmployee.EmergencyContactPhone, DimEmployee.SalariedFlag, 
                  DimEmployee.Gender, DimEmployee.PayFrequency, DimEmployee.BaseRate, DimEmployee.VacationHours, DimEmployee.SickLeaveHours, DimEmployee.CurrentFlag, DimEmployee.SalesPersonFlag, DimEmployee.DepartmentName, 
				  DATENAME(year, DimEmployee.StartDate) AS StartDate_year ,DATENAME(MONTH, DimEmployee.StartDate) AS StartDate_Month,DATENAME(DAY, DimEmployee.StartDate) AS StartDate_day,DimEmployee.EndDate,DimEmployee.Status, COALESCE(DimDepartmentGroup.DepartmentGroupName,'undefined') as DepartmentGroupName,
				  CASE WHEN DimEmployee.Status IS NULL AND DimDepartmentGroup.DepartmentGroupName IS NULL THEN 'Resigned'
				  WHEN DimEmployee.Status = 'Current' AND DimDepartmentGroup.DepartmentGroupName IS NULL THEN 'Left the department' ELSE 'Current'
				  END AS Current_status
FROM     DimEmployee LEFT OUTER JOIN
                  DimDepartmentGroup INNER JOIN
                  DimDate INNER JOIN
                  FactSalesQuota ON DimDate.DateKey = FactSalesQuota.DateKey INNER JOIN
                  FactFinance ON DimDate.DateKey = FactFinance.DateKey ON DimDepartmentGroup.DepartmentGroupKey = FactFinance.DepartmentGroupKey ON DimEmployee.EmployeeKey = FactSalesQuota.EmployeeKey