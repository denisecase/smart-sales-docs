# Choose Your DW Tools

## Choose Your Data Warehousing Option

Decide how you want to create your data warehouse - which tools and techniques do you want to learn?

- A: If new, **SQLite** is the most accessible and reliable starting point.
- B: **DuckDB** is also lightweight and built specifically for OLAP-style analytics.
- C: The **dbt** option is widely used in real-world data pipelines to manage transformations and track lineage in complex environments.
- D: **SQLMesh** is a modern alternative to dbt, known for its declarative SQL style and dynamic graph-based model management. SQLMesh requires all table names to be prefixed, e.g., `smart_sales_sqlmesh.customers`. 

Any choice is a good one to get practice with data warehousing. 
They will all create a data warehouse ready for BI analytics. 

--- 

## If B, C, or D: Add External Packages (As Needed)

You should already have a `.venv` environment available.  
If you choose advanced tools (DuckDB, dbt, or SQLMesh), you may need to install additional external packages.
Open and review `requirements.txt`.  
Associated packages vary in size, enabling all of them may require over 100 MB of disk space.
Edit `requirements.txt` and uncomment the packages associated with the option you choose. You'll need duckdb for all three non-sqlite options, and two more packages for dbt and one more package for sqlmesh. 

```txt
duckdb
dbt-core
dbt-duckdb
sqlmesh
```

Activate `.venv` and re-run the pip install commands if additional packages were added (or uncommented in requirements.txt).
Associated commands are included below for convenience. See [requirements.txt](requirements.txt) or [pro-analytics-01](https://github.com/denisecase/pro-analytics-01) for more detailed instructions. 

Mac/Linux Commands

Open your smart sales repository in VS Code. 
Open a terminal in the root project folder. 
Activate your .venv and run the necessary commands depending on your engine choice. 

```shell
source .venv/bin/activate
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install --upgrade -r requirements.txt --timeout 100
```

Windows PowerShell Commands

Open your smart sales repository in VS Code. 
Open a PowerShell terminal in the root project folder. 
Activate your .venv and run the necessary commands depending on your engine choice. 

```shell
.venv\Scripts\activate
py -m pip install --upgrade pip setuptools wheel
py -m pip install --upgrade -r requirements.txt --timeout 100
```

---

## OPTION A: Using SQLITE (Built in Python Support)

In our scripts/create_dw folder, complete the `create_dw_sqlite.py` script to create and populate a SQLite data warehouse using Python. 
Open a terminal in the root project folder and run the script. 
If Mac/Linux, use the first, if Windows PowerShell use the second:

```shell
python3 scripts/dw_create/create_dw_sqlite.py
py scripts/dw_create/create_dw_sqlite.py
```

## OPTION B: Using DuckDB (OLAP Database)

In our scripts/create_dw folder, complete the `create_dw_duckdb.py` script to create and populate a DuckDB data warehouse using Python. 
Open a terminal in the root project folder and run the script. 
If Mac/Linux, use the first, if Windows PowerShell use the second:

```shell
python3 scripts/dw_create/create_dw_duckdb.py
py scripts/dw_create/create_dw_duckdb.py
```

## OPTION C: Using Database Build Tool (dbt)

See [REF_MODULE4_DBT.md](REF_MODULE4_DBT.md) for information about how to use the widely-used dbt to build a DuckDB data warehouse. 

After creating and populating your DuckDB dw using SQLMesh, open a terminal in the root project folder and run the following to verify. 
If Mac/Linux, use the first, if Windows PowerShell use the second:

```shell
python3 scripts/dw_create/verify_dw_dbt.py
py scripts/dw_create/verify_dw_dbt.py
```

## OPTION D: Using SQLMesh

See [REF_MODULE4_SQLMESH.md](REF_MODULE4_SQLMESH.md) for information about how to use the newer SQLMesh to build a DuckDB data warehouse. 

After creating and populating your DuckDB dw using SQLMesh, open a terminal in the root project folder and run the following to verify. 
If Mac/Linux, use the first, if Windows PowerShell use the second:

```shell
python3 scripts/dw_create/verify_dw_sqlmesh.py
py scripts/dw_create/verify_dw_sqlmesh.py
```
---

## After Making Progress

Once you’ve verified the scripts ran successfully, 
git add, commit, and push changes to your GitHub repository.

```shell
git add .
git commit -m "custom message"
git push -u origin main
```

For best results, git add-commit-push frequently after making any useful progress. 
