/*
    Staging: Dim Location
    Purpose: Build a distinct location dimension (continent, country, city)
    from the raw retail sales source table.
*/

-- 1) Quick source preview (EDA)
SELECT
    [Continent],
    [Country],
    [City]
FROM [stg_retail_sales].[dbo].[raw_retail_sales];

-- 2) Create staging dimension table
IF OBJECT_ID('[stg_retail_sales].[dbo].[stg_dim_location]', 'U') IS NOT NULL
    DROP TABLE [stg_retail_sales].[dbo].[stg_dim_location];

CREATE TABLE [stg_retail_sales].[dbo].[stg_dim_location] (
    [continent] NVARCHAR(255),
    [country] NVARCHAR(255),
    [city] NVARCHAR(255)
);

-- 3) Load distinct location rows
INSERT INTO [stg_retail_sales].[dbo].[stg_dim_location] (
    [continent],
    [country],
    [city]
)
SELECT DISTINCT
    [Continent] AS [continent],
    [Country] AS [country],
    [City] AS [city]
FROM [stg_retail_sales].[dbo].[raw_retail_sales];

-- 4) Validate loaded staging data
SELECT
    [continent],
    [country],
    [city]
FROM [stg_retail_sales].[dbo].[stg_dim_location];