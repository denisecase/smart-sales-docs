# D4.2 Designing a Data Warehouse

Designing a Data Warehouse involves careful planning and understanding of both the data and the business requirements. Here are the key components and considerations involved:

## Schema Design

In Data Warehousing, schema refers to how the database is structured, and there are two popular designs:

- **Star Schema**: The simplest style of data mart schema that consists of one or more fact tables referencing any number of dimension tables, which help minimize the complexity of database design and queries.
- **Snowflake Schema**: A more complex schema where the dimension tables are normalized, which eliminates redundancy but may require more complex queries.

## Design Considerations

- Normalization vs. Denormalization: While normalized tables reduce redundancy, denormalization can improve query performance. In a data warehouse, it's common to use a denormalized approach to optimize for read operations.
- Primary and Foreign Keys: Ensure primary keys uniquely identify each record in the dimension tables. Foreign keys in the fact table reference these primary keys, establishing relationships between tables.

## Follow Table / Column Naming Conventions

In general, follow these naming conventions:

- Table names: all lowercase and pluralized (e.g., customers, sales, products) NOTE: Some organizations prefer singular table names - pick one and be consistent.
- Column names: all lowercase with underscores separating words (e.g., customer_id, sale_date)

## Example Star Schema Design

The star schema tends to have one central, numeric fact table, with as many additional dimension tables supporting those facts as needed. 
In our example, we would make our sales table the central fact table, and provide dimension tables for customers and products (you might choose to add more). 
Dimension Tables contain descriptive attributes related to the fact table. They provide context to the measures in the fact table.

### One Central Fact Table: `sales`

The fact table contains quantitative data representing business events.
It includes foreign keys to dimension tables and measures for analysis.

| column_name     | data_type | description                     |
|-----------------|-----------|---------------------------------|
| sale_id         | INTEGER   | Primary key                     |
| date            | DATE[1]   | Date of the transaction         |
| customer_id     | TEXT      | Foreign key to customers        |
| product_id      | TEXT      | Foreign key to products         |
| quantity        | INTEGER   | Quantity of items sold          |
| sales_amount    | REAL      | Total sales amount              |

[1] When using SQLite, there is not a DATE type, so we use a text field with the date in ISO 8601 strings ("YYYY-MM-DD").

### Dimension Table: `customers`

| column_name | data_type | description                       |
|-------------|-----------|-----------------------------------|
| customer_id | TEXT      | Primary key                       |
| name        | TEXT      | Name of the customer              |
| region      | TEXT      | Region where customer resides     |
| join_date   | DATE      | Date when the customer joined     |

### Dimension Table: `products`

| column_name  | data_type | description                      |
|--------------|-----------|----------------------------------|
| product_id   | TEXT      | Primary key                      |
| product_name | TEXT      | Name of the product              |
| category     | TEXT      | Category of the product          |
| unit_price   | REAL      | Price per unit of the product    |

A well-designed data warehouse schema is essential for efficient querying, accurate analysis, and reliable business intelligence reporting.
