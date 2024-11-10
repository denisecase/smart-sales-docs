## Create the Data Warehouse

Use SQLite to define and create tables for your data warehouse. The script will set up the database schema based on your design.

In your Python script, use the sqlite3 library in the Python Standard Library to connect to SQLite and execute SQL commands to create tables.

- Define the schema for your fact and dimension tables.
- Ensure that your fact table includes foreign keys that reference the primary keys of your dimension tables.
- Follow conventions for naming tables and columns. 

In VS Code, open a terminal. 

Activate the local project virtual environment if not already active. 

Execute the script to create the database and tables - use the command that works for your operating system. 

In Windows / PowerShell

```shell
py scripts/data_warehouse/create_dw.py
```

In Mac / Linux terminal

```shell
python3 scripts/data_warehouse/create_dw.py
```
