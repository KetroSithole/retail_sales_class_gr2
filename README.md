# Retail Sales SQL Pipeline

## Overview
This folder contains SQL scripts for a simple staging pipeline.
The pipeline reads raw retail sales data and builds staging dimension tables.

Current focus:
- Set up databases
- Inspect source columns
- Build customer dimension staging table
- Build location dimension staging table

## Files In This Folder
- 1.CreateDb.sql
- 3..0.stg_Dim.sql
- 3.1.stg_Dim_customer.sql
- 3.2.stg_Dim_Location.sql
- retail_sales - retail_sales.csv

## What Happens To The Data
1. Databases are created if they do not already exist.
2. Raw source table is inspected: stg_retail_sales.dbo.raw_retail_sales.
3. Distinct customer values are loaded into stg_retail_sales.dbo.stg_dim_customer.
4. Distinct location values are loaded into stg_retail_sales.dbo.stg_dim_location.
5. Validation SELECT queries are used to review staged results.

## Current Data Flow Diagram
```mermaid
flowchart LR
    A[retail_sales - retail_sales.csv] --> B[raw_retail_sales table]
    B --> C[Source inspection query<br/>3..0.stg_Dim.sql]
    B --> D[Build stg_dim_customer<br/>3.1.stg_Dim_customer.sql]
    B --> E[Build stg_dim_location<br/>3.2.stg_Dim_Location.sql]
    F[1.CreateDb.sql] --> G[stg_retail_sales database]
    F --> H[dhw_retail_sales database]
    D --> I[Validation query]
    E --> J[Validation query]
```

## Script Execution Order
Run scripts in this order:
1. 1.CreateDb.sql
2. Load data into stg_retail_sales.dbo.raw_retail_sales (if not loaded yet)
3. 3..0.stg_Dim.sql
4. 3.1.stg_Dim_customer.sql
5. 3.2.stg_Dim_Location.sql

## Current Model Snapshot
```mermaid
flowchart TB
    subgraph STG[stg_retail_sales]
        RAW[(raw_retail_sales)]
        DC[(stg_dim_customer)]
        DL[(stg_dim_location)]
    end

    RAW -->|SELECT DISTINCT Customer_ID, Customer_Segment| DC
    RAW -->|SELECT DISTINCT Continent, Country, City| DL
```

## Future Flow (Recommended)
This is a suggested next phase for scaling your project.

```mermaid
flowchart LR
    A[CSV / source files] --> B[Raw landing table]
    B --> C[Data quality checks]
    C --> D[Staging dimensions]
    C --> E[Staging fact sales]
    D --> F[Warehouse dimensions in dhw_retail_sales]
    E --> G[Warehouse fact table in dhw_retail_sales]
    F --> H[Star schema joins]
    G --> H
    H --> I[Power BI / reporting layer]
```

## Future Improvements
- Add a fact staging script for sales transactions.
- Add primary keys and surrogate keys for dimension tables.
- Add null handling and data type standardization.
- Add deduplication rules beyond DISTINCT (business keys + latest record logic).
- Add indexes for faster joins and reporting.
- Add audit columns such as load_date and source_file.
- Add stored procedures for scheduled ETL execution.
- Add row count checks and data quality validation steps.

## Quick Validation Queries
Use these checks after each load:
- Count customer rows in stg_dim_customer.
- Count location rows in stg_dim_location.
- Check for null key attributes in dimensions.
- Compare distinct counts between source and staged tables.
