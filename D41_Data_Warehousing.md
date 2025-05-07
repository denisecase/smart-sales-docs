# D4.1 Data Warehousing

After preparing data for the ETL (Extract, Transform, Load) process, the next step in the BI (Business Intelligence) lifecycle involves creating a place to store this data in a structured repository.

---

## Data Warehouse vs. Data Lake vs. Lakehouse

### Data Warehouse
A **Data Warehouse** is a centralized repository designed to support decision making. 
It stores integrated data from multiple sources that has been cleaned, transformed, and structured into a defined schema. 
Data Warehouses are optimized for fast retrieval of data, making them ideal for querying and reporting.

Examples include:
- **Amazon Redshift**: A widely used cloud-based data warehouse known for its fast performance and scalability.
- **Oracle Exadata**: A combined hardware and software offering that provides a high-performance data warehouse solution.
- **IBM Db2 Warehouse**: Known for its robust analytics capabilities and support for large volumes of data.

### Data Lake
A **Data Lake** stores raw data in its native format, including structured data, semi-structured data, and unstructured data. 
The flexibility of a Data Lake allows it to store vast amounts of data without prior organization, making it suitable for big data and machine learning where data structure and requirements are not fully known upfront.

Examples include:
- **Amazon S3**: Often used as a data lake due to its vast storage capacity and durability.
- **Microsoft Azure Data Lake Storage**: Integrates with Azure ecosystem tools to provide a comprehensive data lake solution.
- **Google Cloud Storage**: Used by organizations leveraging the Google Cloud Platform for analytics and machine learning.


### Lakehouse
A **Lakehouse** combines the best features of both Data Lakes and Data Warehouses. 
It provides the vast storage capabilities of a Data Lake and the management features of a Data Warehouse, allowing for both high flexibility and efficient data querying.

Examples include:
- **Databricks Delta Lake**: Offers ACID transactions and scalable metadata handling over a data lake.
- **Snowflake**: Although primarily a data warehouse, it incorporates many features of data lakes, promoting a lakehouse approach.

---

## Understanding Dimensions and Facts

In the context of a Data Warehouse, data is often organized into **dimensions** and **facts**, which are fundamental to understanding how to effectively design and use a Data Warehouse.

### Dimensions
**Dimensions** refer to the descriptive attributes related to business entities. 
These are the aspects by which analytic measures are segmented, categorized, and described. 
Common dimensions include time, geography, products, and customers. 
For instance, in a sales analysis, dimensions might include the product being sold, the store selling the product, and the time period of sales.

### Facts
**Facts** are the measurements or metrics that are stored and analyzed. 
In a business context, facts are typically numerical values that can be aggregated – for example, sales revenue, units sold, or total costs. 
These are the core of analytical queries and are often the focus of business reporting and analysis.

## The Importance of Good Design in BI

The design of a Data Warehouse directly influences its effectiveness in supporting business intelligence processes. Well-designed storage solutions reflect:

- Proper structuring and indexing of data can drastically reduce the time it takes to retrieve insights.
- Good design ensures that the warehouse can grow with the business, handling increasing amounts of data and queries without performance loss.
- A well-structured warehouse or lakehouse helps maintain data integrity and consistency.
- As business needs evolve, a well-designed warehouse can adapt to changes in data requirements.

---

## Data Warehouse Storage (SQLite or DuckDB)

A data warehouse can be created using a variety of tools depending on scale, complexity, and performance requirements.  
There are two lightweight, local storage solutions to choose between:

- **SQLite**: A simple, file-based relational database that is lightweight and easy to configure. Includes built-in Python support in the Standard Library. 
- **DuckDB**: An in-process SQL OLAP database designed for fast analytics directly on local files. Requires the external package `duckdb`. 

Either option enables demonstrating the principles of Data Warehousing without the complexity or expense of cloud-based deployments.  

---

## Data Warehouse Implementation: SQLite DW

When you choose to implement your Data Warehouse with **SQLite**, you will:
- Use SQL to define your schema and load data.
- Store your entire database in a single `.sqlite` or `.db` file.
- Query the database directly using SQL in Python or command line.

SQLite is great for:
- Simplicity and portability.
- Quick setups with minimal dependencies.
- Local development and prototyping.

When implementing a **DuckDB** data warehouse, we can use native Python (with the duckdb external package), or we can use two powerful tools for transformation and modeling: dbt or SQLMesh. 

## Data Warehouse Implementation: DuckDB DW

If you choose **DuckDB**, you have three different ways to build your Data Warehouse: 

1. **Native Python with DuckDB**  
   You can use the `duckdb` Python package to:
   - Create tables directly from CSV or Parquet files.
   - Perform SQL queries in-memory for high-speed analytics.
   - Load and manipulate large datasets without additional database services.

2. **dbt (Data Build Tool) with DuckDB**  
   If you want modular, testable SQL models with version control and documentation:
   - Use `dbt` to build a structured, reproducible Data Warehouse.
   - Manage your transformations through SQL models defined in `.sql` files.
   - Leverage YAML configurations for dependencies and documentation.

3. **SQLMesh with DuckDB**  
   For declarative modeling and dependency-based transformations:
   - Use `SQLMesh` to define models and dependencies.
   - Automatically manage migrations and run tests.
   - Track changes over time and execute reproducible builds.

---

