# Star Schema Design

## Section 1: Schema Overview (4 marks)

### FACT TABLE: fact_sales

Grain: One row per product per order line item  
Business Process :Sales transactions

Measures (Numeric Facts):**
- **quantity_sold:** Number of units sold
- **unit_price:** Price per unit at time of sale
- **discount_amount:** Discount applied on the line item
- **total_amount:** Final amount (quantity_sold × unit_price − discount_amount)

Foreign Keys:
- **date_key** -> dim_date
- **product_key** -> dim_product
- **customer_key** -> dim_customer

---

### DIMENSION TABLE: dim_date

Purpose: Date dimension for time-based analysis  
Type: Conformed dimension

Attributes:
- **date_key (PK):** Surrogate key (integer, format: YYYYMMDD)
- **full_date:** Actual calendar date
- **day_of_week:** Monday, Tuesday, etc.
- **month:** Numeric month (1–12)
- **month_name:** January, February, etc.
- **quarter:** Q1, Q2, Q3, Q4
- **year:** Calendar year (e.g., 2023, 2024)
- **is_weekend:** Boolean flag (true/false)

---

### DIMENSION TABLE: dim_product

Purpose: Product-related descriptive information  
Type: Conformed dimension

Attributes:
- **product_key (PK):** Surrogate key
- **product_id:** Natural product identifier from source system
- **product_name:** Name of the product
- **category:** Product category (e.g., Electronics, Furniture)
- **brand:** Brand or manufacturer
- **model:** Product model
- **launch_date:** Product launch date
- **is_active:** Indicates whether product is currently sold

---

### DIMENSION TABLE: dim_customer

**Purpose:** Customer-related descriptive information  
**Type:** Conformed dimension

**Attributes:**
- **customer_key (PK):** Surrogate key
- **customer_id:** Natural customer identifier from source system
- **customer_name:** Full name of the customer
- **gender:** Customer gender
- **city:** City of residence
- **state:** State of residence
- **country:** Country of residence
- **customer_segment:** Retail, Corporate, etc.
- **signup_date:** Customer registration date

---
Section 2: Design Decisions

The granularity of the fact table is chosen at the transaction line-item level to capture a detailed view of sales activity for accurate analysis of product performance, discounts, and customer behavior. Finer granularity also enables flexible aggregation across product, and customer dimensions without losing detail.

Surrogate keys are used to improve query performance and ensure stability. They also simplify joins between fact and dimension tables.

This star schema design supports drill-down and roll-up operations effectively. Analysts can roll up sales data by month or quarter or product category or customer segment and drill down to specific dates, products, or customers. The clear separation of facts and dimensions ensures fast analytical queries.

---

## Section 3: Sample Data Flow (3 marks)

### Source Transaction

- **Order Number:** 101  
- **Customer:** John  
- **Product:** Laptop  
- **Quantity:** 2  
- **Unit Price:** 50,000

---

### Becomes in Data Warehouse

**fact_sales:**
```
{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  discount_amount: 0,
  total_amount: 100000
}
```

**dim_date:**
```
{
  date_key: 20240115,
  full_date: '2024-01-15',
  day_of_week: 'Monday',
  month: 1,
  month_name: 'January',
  quarter: 'Q1',
  year: 2024,
  is_weekend: false
}
```

**dim_product:**
```
{
  product_key: 5,
  product_name: 'Laptop',
  category: 'Electronics',
  brand: 'Generic',
  is_active: true
}
```

**dim_customer:**
```
{
  customer_key: 12,
  customer_name: 'John',
  city: 'Mumbai',
  state: 'Maharashtra',
  country: 'India'
}
```

