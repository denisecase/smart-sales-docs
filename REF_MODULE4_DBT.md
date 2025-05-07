## OPTIONAL/ADVANCED OPTION: Using dbt

The folder (`dbt/`) contains everything needed to define and build
 a data warehouse using [dbt Core](https://docs.getdbt.com/). 
We're using **DuckDB** as our database engine and loading clean CSV files from `data/prepared/`.

## dbt/ Folder Overview

- [`dbt_project.yml`](dbt/profiles.yml)  
  Main project config file (defines paths, materializations, database name, etc.)

- [`profiles.yml`](dbt/profiles.yml)
Connection settings for the DuckDB database. Co-located for convenience.

- `models/`  
  SQL models that define each table (one per logical table: e.g., customers, products, sales)

- `target/`  
  Created automatically by dbt when you run commands (do not edit)


## Example SQL in a Model

Paths in models must be exactly correct. In Mac/Linux we use forward slashes, in Windows, we need two backslashes in the paths. 
In Mac/Linux we use forward slashes, in Windows, we need two backslashes in the paths. 

### Mac/Linux Model Example

```sql
-- File: models/customers.sql
select *
from read_csv_auto('./data/prepared/customers_prepared.csv')
```

--- 

## How Models Work in dbt

Each model (like `customers.sql`) selects from a cleaned CSV file using DuckDB’s `read_csv_auto()` function.  
When `dbt` runs, it creates those as database tables in `dw/smart_sales_dbt.duckdb`.  
The name (`smart_sales_dbt`) is specified in [`dbt/profiles.yml`](dbt/profiles.yml) as the **default_connection.config.path** attribute.



### Windows Model Example

```sql
-- File: models/customers.sql
select *
from read_csv_auto('.\\data\\prepared\\customers_prepared.csv')
```

## Mapping CSV Columns to Data Warehouse Columns

DuckDB preserves the original column names from the CSV file—these are often capitalized or camelCase (e.g., CustomerID).
You can easily rename and standardize column names in your dbt models using SQL aliases:

```sql
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
```

This approach lets you:
- Import from CSV files exactly as they are.
- Use consistent lowercase snake_case naming in your data warehouse
- Avoid confusing case sensitivity errors in DuckDB

IMPORTANT: Quoted column names (like "CustomerID") are case-sensitive.
Select them with the SQL keyword `as` to map them to your preferred dw naming conventions.

---

## Running dbt Commands

From your root project folder (the parent of dbt/), open a terminal in VS Code. 
Use PowerShell if running Windows. 

```shell
clear
dbt debug --project-dir dbt --profiles-dir dbt
clear
dbt build --project-dir dbt --profiles-dir dbt
```
