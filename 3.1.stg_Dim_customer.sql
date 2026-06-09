--1.Eda 
SELECT
       [Customer_ID]
      ,[Customer_Segment]
  FROM [stg_retail_sales].[dbo].[raw_retail_sales]
--2. Create stg_Dim_Customer
     create table [stg_retail_sales].[dbo].stg_dim_Customer
     ( customerID varchar(250),
      Customer_Segment varchar(250)
     )
--3. Insert data into stg_Dim_Customer
     insert into [stg_retail_sales].[dbo].stg_dim_Customer
     select distinct [Customer_ID], [Customer_Segment]
     from [stg_retail_sales].[dbo].[raw_retail_sales]
--4. Check the data in stg_Dim_Customer
     select * from [stg_retail_sales].[dbo].stg_dim_Customer