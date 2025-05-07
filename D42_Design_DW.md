# D4.2 Designing a Data Warehouse

Designing a Data Warehouse involves careful planning and understanding of both the data and the business requirements. Here are the key components and considerations involved:

## Schema Design

In Data Warehousing, schema refers to how the database is structured, and there are two popular designs:

- **Star Schema**: The simplest style of data mart schema that consists of one or more fact tables referencing any number of dimension tables, which help minimize the complexity of database design and queries.
- **Snowflake Schema**: A more complex schema where the dimension tables are normalized, which eliminates redundancy but may require more complex queries.


## Example: Star Schema


**Fact Table: Sales**

This table contains quantitative data for analysis, including metrics related to transactions such as `SalesAmount`. 
It connects to dimension tables through foreign keys.

**Dimension Tables: Customers, Products**

Dimension Tables contain descriptive attributes related to the fact table. They provide context to the measures in the fact table.
  
- Customers Table: Contains information about customers.
- Products Table: Contains details about products.

Design Considerations

- Normalization vs. Denormalization: While normalized tables reduce redundancy, denormalization can improve query performance. In a data warehouse, it's common to use a denormalized approach to optimize for read operations.
- Primary and Foreign Keys: Ensure primary keys uniquely identify each record in the dimension tables. Foreign keys in the fact table reference these primary keys, establishing relationships between tables.


## Data Warehouse Schema

In general, we will follow the convention that table names are lowercase and pluralized. 
Column names are all lowercase with underscores. 

### Fact Table: sales

The following are examples of possible columns.
TODO: Update your design to reflect your data and tool choices. 

| column_name     | data_type | description                     |
|-----------------|-----------|---------------------------------|
| sale_id         | INTEGER   | Primary key                     |
| date            | DATE      | Date of the transaction         |
| customer_id     | TEXT      | Foreign key to customers        |
| product_id      | TEXT      | Foreign key to products         |
| store_id        | TEXT      | Foreign key to stores           |
| campaign_id     | TEXT      | Foreign key to campaign         |
| Quantity        | INTEGER   | Number of items                 |
| sales_amount    | REAL      | Total sales amount              |

### Dimension Table: customers

The following are examples of possible columns.
TODO: Update your design to reflect your data and tool choices. 

| column_name | data_type | description                       |
|-------------|-----------|-----------------------------------|
| customer_id | TEXT      | Primary key                       |
| name        | TEXT      | Name of the customer              |
| region      | TEXT      | Region where customer resides     |
| join_date   | DATE      | Date when the customer joined     |

### Dimension Table: products

The following are examples of possible columns.
TODO: Update your design to reflect your data and tool choices. 

| column_name  | data_type | description                      |
|--------------|-----------|----------------------------------|
| product_id   | TEXT      | Primary key                      |
| product_name | TEXT      | Name of the product              |
| category     | TEXT      | Category of the product          |
| unit_price   | REAL      | Price per unit of the product    |

A well-designed data warehouse is instrumental in enabling efficient data analysis and business intelligence reporting. 
