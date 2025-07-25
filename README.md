## 📊 SQL Training: Data Exploration Using AdventureWorksDW2016

---

## 📌 Overview

This SQL training project contains a collection of analytical and exploratory queries written against the **AdventureWorksDW2016** data warehouse.  
The goal is to help data analysts, BI professionals, and students practice meaningful SQL queries using a real-world schema.

The queries focus on exploring employee data, customer behavior, product details, and sales transactions using fact and dimension tables.

---

## 📁 Files Included

### **Sql Query Training.sql**
Contains 6 SQL exercises focusing on filtering, joining, grouping, and aggregation.

### **Sql Query Training2.sql**
An advanced employee-focused query demonstrating multi-table joins, conditional logic, and date extraction.

---

## 📊 Key SQL Exercises

### 1. Employee Overview
Retrieves all employees from `DimEmployee` and sorts them by `Title`.

---

### 2. Product Filtering
Filters `DimProduct` records where `StartDate` is not null and `ProductLine` starts with `'T'`.

---

### 3. Freight by Customer
Joins `FactInternetSales` and `DimCustomer` to calculate total freight per customer.

---

### 4. Customer Product Cost Summary
Aggregates total and average product cost per customer with associated sales reasons.

---

### 5. City-Customer-Reseller Link
Joins `DimGeography`, `DimReseller`, and `DimCustomer` to show unique city-reseller-customer relationships.

---

### 6. Customer + Employee Sales Insight
A multi-join query combining `FactInternetSales`, `FactResellerSales`, `DimEmployee`, and `DimCustomer` to analyze tax, product cost, and order quantity by employee.

---

### 7. Employee Status & Department Insight
(from `Sql Query Training2.sql`)  
Retrieves employee data with department group logic and derives `Current_status` using `CASE` and `COALESCE`.

---

## 🧾 Tables and Fields Used

These queries are based on the **AdventureWorksDW2016** database and involve the following tables:

- `DimEmployee`
- `DimCustomer`
- `DimProduct`
- `DimReseller`
- `DimGeography`
- `DimDate`
- `DimDepartmentGroup`
- `FactInternetSales`
- `FactResellerSales`
- `FactSalesQuota`
- `FactFinance`

**Key fields include:**

- `EmployeeKey`, `Current_status`, `Title`, `HireDate`, `StartDate_year`
- `CustomerKey`, `FirstName`, `EmailAddress`, `Gender`, `MaritalStatus`
- `ProductKey`, `ProductLine`, `StartDate`, `TaxAmt`, `Freight`, `TotalProductCost`

---

## 🛠️ Tools and Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS) or Azure Data Studio
- AdventureWorksDW2016 Sample Database

---

## 🚀 How to Use

1. Install or restore the **AdventureWorksDW2016** database on your SQL Server instance.
2. Open `.sql` files in SSMS or Azure Data Studio.
3. Execute queries one by one to review their logic and output.
4. Modify or extend the queries for your learning or reporting needs.

---

## 💼 Use Cases

- SQL learning and hands-on training
- Interview preparation for data analyst roles
- BI reporting logic practice
- Exploration of star schema and data warehouse models

---
