# sql / dw_create Folder

This folder contains the SQL scripts needed to create the data warehouse (DW) tables. 

They are called by the Python scripts in scripts/dw_create for Options A and B, using sqlite or DuckDB for the data warehouse. 

TODO: Modify the files in this folder and the corresponding Python scripts in scripts/dw_create to complete creation of YOUR unique data warehouse

## Notes

The numeric prefixes indicate the order of creation. 

Tables must be created in a specific order, so any foreign references exist first before they are used in another table. 

For example, create dimension tables first, and the fact tables AFTER the dimension tables exist. 

To be able to rerun the scripts while debugging, DROP ALL TABLES first - in reverse order of how they were created. That is, start by dropping the fact table first, and then we can delete the dimension tables on which the fact table depends. 

There are two versions of the `sales` table script:
- `90_create_sales.sql`: Full version if referential integrity is maintained.
- `91_create_sales.sql`: Alternate version with integrity checks commented out. This is useful if DuckDB encounters issues during creation.

Files for Option A (and B if possible): 

- 00_drop_all_tables.sql
- 10_create_customers.sql
- 20_create_products.sql
- 90_create_sales.sql

Files for Option B (in case of referential integrity errors): 

- 00_drop_all_tables.sql
- 10_create_customers.sql
- 20_create_products.sql
- 91_create_sales.sql

