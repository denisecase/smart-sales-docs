## Create the Data Warehouse

Use SQLite to define and create tables for your data warehouse. The script will set up the database schema based on your design.

In your Python script, use the sqlite3 library in the Python Standard Library to connect to SQLite and execute SQL commands to create tables.

- Define the schema for your fact and dimension tables.
- Ensure that your fact table includes foreign keys that reference the primary keys of your dimension tables.

Execute the script to create the database and tables.

```shell
python scripts/data_warehouse/create_dw.py
```
