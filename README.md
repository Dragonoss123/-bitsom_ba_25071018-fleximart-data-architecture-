# -bitsom_ba_25071018-fleximart-data-architecture-

# FlexiMart Data Architecture Project

Student Name: Aditya Srinath  
Student ID: bitsom_ba_25071018  
Email: s.aditya.srinath@gmail.com  
Date: 08-01-2026

---

## Project Overview

The FlexiMart Data Architecture Project demonstrates the design and implementation of a complete data ecosystem for a retail business. The project covers relational database ETL processing, NoSQL data modeling using MongoDB, and a dimensional data warehouse with OLAP analytics to support business decision-making.

---

## Repository Structure

├── data
|    ├──customers_raw.csv
|    ├──products_raw.csv		
|    ├──sales_raw.csv
|
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
|
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
|
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
|
└── README.md
```

---

## Technologies Used

- Python 3.14
- PostgreSQL 14
- MongoDB 6.0 

---

## Setup Instructions

### Database Setup

```bash
# Create operational and data warehouse databases
psql -u root -p -e "CREATE DATABASE fleximart;"
psql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 – ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 – Business Queries
psql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 – Data Warehouse Schema and Data
psql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
psql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
psql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql
```
---

### MongoDB Setup

```bash
mongosh < part2-nosql/mongodb_operations.js
```


---

Key Learnings

Through this project, I gained experience in designing end-to-end data architectures. I learned how to build ETL pipelines, apply dimensional modeling techniques such as star schema design, and perform OLAP analysis for business insights. The project also improved my understanding of NoSQL databases and how they complement relational systems in modern data platforms.

---

Challenges Faced

1.Handling schema differences across databases: Resolved by adapting SQL syntax for MySQL and PostgreSQL separately.
2.Maintaining data consistency across ETL and warehouse layers: Addressed through surrogate keys, proper constraints, and validation queries.

---

## Conclusion

This project provides a comprehensive view of how data flows from source systems to analytical platforms, enabling efficient reporting and informed decision-making in a retail business context.

