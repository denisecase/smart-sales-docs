MODEL (
    name smart_sales_sqlmesh.sales,
    kind FULL,
    dialect duckdb
);

-- File: models/sales.sql
-- Purpose: Load cleaned sales data into the DuckDB data warehouse

-- This is a sqlmesh model:
-- - Materialized as a table named 'sales' in smart_sales_dbt.duckdb
-- - Built by reading a cleaned CSV using DuckDB’s read_csv_auto()
-- - Uses a Windows-style path (see REF_SQLMESH.md for cross-platform guidance)

select
    "TransactionID"  as sale_id,
    "SaleDate"       as date,
    "CustomerID"     as customer_id,
    "StoreID"        as store_id,
    "CampaignID"     as campaign_id,
    "SaleAmount"     as sales_amount
from read_csv_auto('..\\data\\prepared\\sales_prepared.csv')

-- Notes:
-- - CSV path is relative to root project directory
-- - CSV must be pre-cleaned and stored in data/prepared/
-- - Column names must match CSV file and the expected schema exactly.
-- - This DuckDB table does not exist until you run: 
--     sqlmesh plan --auto-apply 
--     (from the sqlmesh directory)
