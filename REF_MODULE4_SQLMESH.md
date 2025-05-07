## OPTIONAL/ADVANCED OPTION: Using SQLMesh

[SQLMesh](https://sqlmesh.com/) is a modern alternative to dbt. It supports declarative SQL modeling, dependency tracking, and can integrate with Python when needed. SQLMesh is a great option for learning SQL-based transformation pipelines with a modern interface.

### Setup Instructions

To use SQLMesh with this project:

1. **Install the SQLMesh Package**  
   Uncomment `sqlmesh` in `requirements.txt` and run pip install:

   - On Mac/Linux:
     - `source .venv/bin/activate`
     - `python3 -m pip install --upgrade -r requirements.txt`

   - On Windows:
     - `.venv\Scripts\activate`
     - `py -m pip install --upgrade -r requirements.txt`

2. **Initialize the SQLMesh Project**

First, create a sqlmesh directory and cd (change directory into it).
   
```shell
mkdir sqlmesh
cd sqlmesh
```
  
Then run the sqlmesh init command with duckdb as the dialect. 
 
IMPORTANT: Be sure to run the init command from the `sqlmesh` directory NOT the root project directory. It will autogenerate files and folders and you want them created in the `sqlmesh/` directory. 

```shell
sqlmesh init duckdb
```


1. **Add SQL Models to `sqlmesh/models/`**

Each model file defines a table. Create one for each table and point each to the associated CSV file in `data/prepared/`.

Example `models/customers.sql`):

SELECT
      "CustomerID" AS customer_id,
      "Name" AS name,
      "Region" AS region,
      "JoinDate" AS join_date
FROM '../data/prepared/customers_prepared.csv'

2. **Customize the Database Path**

   By default, SQLMesh creates an in-memory DuckDB. 
   To persist it to disk, we need to update settings in `sqlmesh/config.yaml`.
   NOTE: The database path is relative to project root and always uses single forward slashes. 

   Edit `sqlmesh/config.yaml` to set the following - keep the rest of the file as is:

```yaml
gateways:
  duckdb:
    connection:
      # For more information on configuring the connection to your execution engine, visit:
      # https://sqlmesh.readthedocs.io/en/stable/reference/configuration/#connections
      # https://sqlmesh.readthedocs.io/en/stable/integrations/engines/duckdb/#connection-options
      type: duckdb
      database: ../dw/smart_sales_sqlmesh.duckdb
```

--- 

1. **Run SQLMesh Commands to Build the Warehouse**

   From inside the `sqlmesh/` folder. Run these commands.
   Use `clear` to empty the terminal window. 
   Run `sqlmesh plan`. 
   When it completes and prompts for backfill, type y.
   Once backfill completes, run `sqlmesh plan --auto-apply
`:

```shell
clear
sqlmesh plan
clear
sqlmesh plan --auto-apply
```



## How Models Work in SQLMesh

Each model (like `customers.sql`) selects from a cleaned CSV file using DuckDB’s `read_csv_auto()` function.  
When `sqlmesh` runs, it creates those as database tables in `dw/smart_sales_sqlmesh.duckdb`.  
The name (`smart_sales_sqlmesh`) is specified in [`sqlmesh/config.yaml`](sqlmesh/config.yaml) as the **gateways.duckdb.connection.database** attribute.

## Example SQL in a Model

Paths in models must be exactly correct. In Mac/Linux we use forward slashes, in Windows, we need two backslashes in the paths. 

### Mac/Linux Model Example

```sql
-- File: models/customers.sql
select *
from read_csv_auto('../data/prepared/customers_prepared.csv')
```

### Windows Model Example

```sql
-- File: models/customers.sql
select *
from read_csv_auto('..\\data\\prepared\\customers_prepared.csv')
```

## Mapping CSV Columns to Data Warehouse Columns

DuckDB preserves the original column names from the CSV file—these are often capitalized or camelCase (e.g., CustomerID).
You can easily rename and standardize column names in your dbt models using SQL aliases:

```sql
MODEL (
    name smart_sales_sqlmesh.customers,
    kind FULL,
    dialect duckdb
);

-- File: models/customers.sql
-- Purpose: Load cleaned customer data into the DuckDB data warehouse

-- This is a sqlmesh model:
-- - Materialized as a table named 'customers' in smart_sales_dbt.duckdb
-- - Built by reading a cleaned CSV using DuckDB’s read_csv_auto()
-- - Uses a Windows-style path (see REF_SQLMESH.md for cross-platform guidance)

select
    "CustomerID"   as customer_id,
    "Name"         as name,
    "Region"       as region,
    "JoinDate"     as join_date
from read_csv_auto('..\\data\\prepared\\customers_prepared.csv')

-- Notes:
-- - CSV path is relative to root project directory
-- - CSV must be pre-cleaned and stored in data/prepared/
-- - Column names must match CSV file and the expected schema exactly.
-- - This DuckDB table does not exist until you run: 
--     sqlmesh plan --auto-apply 
--     (from the sqlmesh directory)

```

This approach lets you:
- Import from CSV files exactly as they are.
- Use consistent lowercase snake_case naming in your data warehouse
- Avoid confusing case sensitivity errors in DuckDB

IMPORTANT: Quoted column names (like "CustomerID") are case-sensitive.
Select them with the SQL keyword `as` to map them to your preferred dw naming conventions.

---
