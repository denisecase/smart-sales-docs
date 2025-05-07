MODEL (
    name smart_sales_sqlmesh.products,
    kind FULL,
    dialect duckdb
);

-- File: models/products.sql
-- Purpose: Load cleaned product data into the DuckDB data warehouse

-- This is a sqlmesh model:
-- - Materialized as a table named 'products' in smart_sales_dbt.duckdb
-- - Built by reading a cleaned CSV using DuckDB’s read_csv_auto()
-- - Uses a Windows-style path (see REF_SQLMESH.md for cross-platform guidance)

select
    "ProductID"     as product_id,
    "ProductName"   as product_name,
    "Category"      as category,
    "UnitPrice"     as unit_price
from read_csv_auto('..\\data\\prepared\\products_prepared.csv')

-- Notes:
-- - CSV path is relative to root project directory
-- - CSV must be pre-cleaned and stored in data/prepared/
-- - Column names must match CSV file and the expected schema exactly.
-- - This DuckDB table does not exist until you run: 
--     sqlmesh plan --auto-apply 
--     (from the sqlmesh directory)
