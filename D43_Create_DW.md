# Create an Initial Data Warehouse Creation Script

Goal: Define and create tables for a data warehouse using a lightweight SQL engine.  

This step sets up the structure (schema) of the warehouse and lays the foundation for later data loading and analysis.

Common options for local or embedded SQL-based data warehouses include:

| Engine    | Description                                                                 |
|-----------|-----------------------------------------------------------------------------|
| **SQLite** | Lightweight, file-based RDBMS with minimal setup. Part of Python standard library. |
| **DuckDB** | In-process analytics database optimized for queries over Parquet/CSV.       |
| **dbt**    | SQL-based transformation framework; ideal for managing models in cloud or DuckDB. |
| **SQLMesh** | Modern alternative to dbt with similar goals but different workflows.      |

In this step, we'll sketch out a new script but leave the details until later. 
This is a common way to develop code. First, get the basics running, and then complete the details. 

## Planning Data Warehouse Creation Script

A data warehouse creation script defines the structure (schema) of the database. 
Regardless of the engine used (e.g., SQLite, DuckDB, or tools like dbt or SQLMesh), the script will typically:

1. Import required modules, e.g., sqlite3, duckdb, or libraries that wrap around SQL models.
1. Define constants, e.g., paths for the database file, directories, or configuration files.
1. Ensure target directories exist, e.g., a data/dw/ folder for storing the local database.
1. Connect to the database engine, either in-process (SQLite, DuckDB) or through a framework (e.g., dbt via command line or SQLMesh via API).
1. Execute SQL statements to create fact and dimension tables based on your schema design.
1. Include logging to track execution and catch errors.
1. Structure functions and main entry points to keep the script reusable, testable, and organized.

This organizational pattern supports:

- Clear separation of responsibilities (e.g., schema creation vs. data loading)
- Easy testing with lightweight engines like SQLite or DuckDB
- Compatibility with more advanced tools like dbt or SQLMesh by swapping out the execution method



## SQLite Example

Open the project repository folder in VS Code. Create a file in scripts/ folder named create_dw_sqlite.py. 

```python
import sqlite3
import sys
import pathlib

# For local imports, temporarily add project root to Python sys.path
PROJECT_ROOT = pathlib.Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))

# Now we can import local modules
from utils.logger import logger  # noqa: E402

# Constants
DW_DIR: pathlib.Path = pathlib.Path("data").joinpath("dw")
DB_PATH: pathlib.Path = DW_DIR.joinpath("smart_sales.db")

# Ensure the 'data/dw' directory exists
DW_DIR.mkdir(parents=True, exist_ok=True)


def create_dw() -> None:
    """Create the data warehouse by creating customer, product, and sale tables."""
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect(DB_PATH)

        # Will need more magic here....

        # Close the connection
        conn.close()
        logger.info("Data warehouse created successfully.")

    except sqlite3.Error as e:
        logger.error(f"Error connecting to the database: {e}")
    except Exception as e:
        logger.error(f"An unexpected error occurred: {e}")
    finally:
        if conn:
            conn.close()

def main() -> None:
    """Main function to create the data warehouse."""
    logger.info("Starting data warehouse creation...")
    create_dw()
    logger.info("Data warehouse creation complete.")

if __name__ == "__main__":
    main()

```
