# D4.1 Data Warehousing

After preparing data for the ETL (Extract, Transform, Load) process, the next step in the BI (Business Intelligence) lifecycle involves creating a place to store this data in a structured repository.
This module explores why these storage solutions are critical and how they are structured to support BI initiatives.

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

## Creating a Data Warehouse

A data warehouse can be created using a variety of tools depending on scale, complexity, and performance requirements. 
Lightweight, local solutions such as **SQLite** and **DuckDB** are often used for prototyping, development, or instructional purposes. 
These tools support SQL and allow for realistic simulation of data warehouse architectures such as star schemas.

### SQLite

**SQLite** is a lightweight relational database management system contained in a single C library.  
It stores the entire database in a single file, simplifying setup and management.  
SQLite supports standard SQL syntax and integrates easily with many analytics environments. 
Its simplicity and portability make it useful for modeling warehouse structures in smaller-scale settings or educational contexts.

### DuckDB: Lightweight Analytics Engine

**DuckDB** is a modern, open-source, in-process SQL OLAP engine designed for analytical workloads.  
It can run SQL queries directly on local structured files such as CSV and **Parquet**. 
Parquet is a columnar storage format that enables efficient compression and fast querying.  
Parquet files are not human-readable and are typically used for production-ready datasets, while CSV or JSON formats are preferred during initial development.

DuckDB provides many of the benefits of larger cloud-based warehouses without requiring a server or setup, making it a powerful option for local analytics.

Key advantages:
- In-memory execution for fast query performance
- Efficient handling of Parquet files and other columnar formats
- Support for complex analytical queries on structured data

### dbt (Data Build Tool): SQL-Based Modeling and Documentation

**dbt** is a command-line tool and framework that enables analysts and engineers to manage data transformations using modular, testable SQL.  
It emphasizes version control, data lineage, and documentation, aligning with modern practices in analytics engineering.

Core capabilities include:
- Defining reusable SQL models
- Managing transformation dependencies via YAML configuration
- Generating browsable documentation and lineage graphs

dbt is widely used alongside tools like Snowflake, Redshift, BigQuery, and DuckDB to maintain clean, traceable, and testable analytics workflows.

### Dates in SQLite and DuckDB

Handling dates is an important aspect of warehouse design and query logic.

- **SQLite** stores dates as strings (typically in ISO 8601 format) and supports date functions like `strftime()` and `DATE()`.
- **DuckDB** supports native `DATE` and `TIMESTAMP` types and can parse ISO-formatted strings directly when reading from CSV or Parquet files.

Using the ISO 8601 format (`YYYY-MM-DD`) ensures compatibility, consistency, and correct sorting across tools and systems.
