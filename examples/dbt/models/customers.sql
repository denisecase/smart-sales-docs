-- File: models/customers.sql
-- Purpose: Load cleaned customer data into the DuckDB data warehouse

-- This is a dbt model:
-- - Materialized as a table named 'customers' in smart_sales_dbt.duckdb
-- - Built by reading a cleaned CSV using DuckDB’s read_csv_auto()
-- - Uses a Windows-style path (see REF_DBT.md for cross-platform guidance)

select
    "CustomerID"   as customer_id,
    "Name"         as name,
    "Region"       as region,
    "JoinDate"     as join_date
from read_csv_auto('.\\data\\prepared\\customers_prepared.csv')

-- Notes:
-- - CSV path is relative to root project directory
-- - CSV must be pre-cleaned and stored in data/prepared/
-- - Column names must match CSV file and the expected schema exactly.
-- - This DuckDB table does not exist until you run: 
--     dbt build --project-dir dbt --profiles-dir dbt 