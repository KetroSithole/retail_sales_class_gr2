/*
	Database setup script
	Purpose: Create staging and data warehouse databases for retail sales ETL.
*/

IF DB_ID('stg_retail_sales') IS NULL
	CREATE DATABASE [stg_retail_sales];
GO

IF DB_ID('dhw_retail_sales') IS NULL
	CREATE DATABASE [dhw_retail_sales];
GO