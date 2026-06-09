--1.EDA 
SELECT
    [Continent],
    [Country],
    [City]
FROM
    [stg_retail_sales].[dbo].[raw_retail_sales] --where Order_ID !='NULL'
    --2create table 
    create table stg_retail_sales.dbo.stg_dim_Location (
        continent nvarchar(255),
        country nvarchar(255),
        city nvarchar(255)
    ) --3 .insert into table
insert into
    stg_retail_sales.dbo.stg_dim_Location
select
    distinct [Continent],
    [Country],
    [City]
FROM
    [stg_retail_sales].[dbo].[raw_retail_sales] 
    --4 SELECT \
select
    *
from
    stg_retail_sales.dbo.stg_dim_Location