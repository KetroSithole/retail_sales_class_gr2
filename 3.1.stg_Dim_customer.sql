/*
     Staging: Dim Customer
     Purpose: Build a distinct customer dimension from raw retail sales data.
*/

-- 1) Quick source preview (EDA)
SELECT
     [Customer_ID],
     [Customer_Segment]
FROM [stg_retail_sales].[dbo].[raw_retail_sales];

-- 2) Create staging customer dimension table
IF OBJECT_ID('[stg_retail_sales].[dbo].[stg_dim_customer]', 'U') IS NOT NULL
     DROP TABLE [stg_retail_sales].[dbo].[stg_dim_customer];

CREATE TABLE [stg_retail_sales].[dbo].[stg_dim_customer] (
     [customer_id] VARCHAR(250),
     [customer_segment] VARCHAR(250)
);

-- 3) Load distinct customer rows
INSERT INTO [stg_retail_sales].[dbo].[stg_dim_customer] (
     [customer_id],
     [customer_segment]
)
SELECT DISTINCT
     [Customer_ID] AS [customer_id],
     [Customer_Segment] AS [customer_segment]
FROM [stg_retail_sales].[dbo].[raw_retail_sales];

-- 4) Validate loaded staging data
SELECT
     [customer_id],
     [customer_segment]
FROM [stg_retail_sales].[dbo].[stg_dim_customer];