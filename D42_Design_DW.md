# D4.2 Designing a Data Warehouse

Designing a Data Warehouse involves careful planning and understanding of both the data and the business requirements. Here are the key components and considerations involved:

### Schema Design

In Data Warehousing, schema refers to how the database is structured, and there are two popular designs:

- **Star Schema**: The simplest style of data mart schema that consists of one or more fact tables referencing any number of dimension tables, which help minimize the complexity of database design and queries.
- **Snowflake Schema**: A more complex schema where the dimension tables are normalized, which eliminates redundancy but may require more complex queries.

### Using SQLite for Schema Design

Given SQLite's lightweight and flexible nature, it is an excellent tool to implement and test schema designs. 

#### Example: Star Schema Design in SQLite


**Fact Table: Sales**

This table contains quantitative data for analysis, including metrics related to transactions such as `Quantity` and `SalesAmount`. It connects to dimension tables through foreign keys.

**Dimension Tables: Customers, Products**

Dimension Tables contain descriptive attributes related to the fact table. They provide context to the measures in the fact table.
  
- Customers Table: Contains information about customers, such as their `Name`, `Region`, and `JoinDate`.
- Products Table: Contains details about products, including `ProductName`, `Category`, and `UnitPrice`.

Design Considerations

- Normalization vs. Denormalization: While normalized tables reduce redundancy, denormalization can improve query performance. In a data warehouse, it's common to use a denormalized approach to optimize for read operations.
- Primary and Foreign Keys: Ensure primary keys uniquely identify each record in the dimension tables. Foreign keys in the fact table reference these primary keys, establishing relationships between tables.


## Data Warehouse Schema

### Fact Table: Sales

| Column Name   | Data Type | Description                |
|---------------|-----------|----------------------------|
| TransactionID | INTEGER   | Primary Key                |
| Date          | DATE      | Date of the transaction    |
| CustomerID    | TEXT      | Foreign Key to Customers   |
| ProductID     | TEXT      | Foreign Key to Products    |
| Quantity      | INTEGER   | Quantity of items sold     |
| SalesAmount   | REAL      | Total sales amount         |


### Dimension Table: Customers

| Column Name | Data Type | Description                |
|-------------|-----------|----------------------------|
| CustomerID  | TEXT      | Primary Key                |
| Name        | TEXT      | Name of the customer       |
| Region      | TEXT      | Region where customer resides |
| JoinDate    | DATE      | Date when the customer joined |

### Dimension Table: Products

| Column Name | Data Type | Description                |
|-------------|-----------|----------------------------|
| ProductID   | TEXT      | Primary Key                |
| ProductName | TEXT      | Name of the product        |
| Category    | TEXT      | Category of the product    |
| UnitPrice   | REAL      | Price per unit of the product |

A well-designed data warehouse is instrumental in enabling efficient data analysis and business intelligence reporting. 
We can use SQLite to simulate a data warehouse and gain practical experience in schema design and data management.

Next, we'll implement the data warehouse. 