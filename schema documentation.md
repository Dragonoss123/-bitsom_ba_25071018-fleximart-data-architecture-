ENTITY: customers

Purpose:
Stores customer master information for all registered users on the FlexiMart platform.

Attributes:

customer_id: Unique identifier for each customer (Primary Key)

first_name: Customer’s first name

last_name: Customer’s last name

email: Customer’s email address (Unique, Not Null)

phone: Customer’s contact number

city: City where the customer resides

registration_date: Date when the customer registered

Relationships:

One customer can place many orders

Relationship type: One-to-Many (1:M) with the orders table

ENTITY: products

Purpose:
Stores product master data available for sale on the platform.

Attributes:

product_id: Unique identifier for each product (Primary Key)

product_name: Name of the product

category: Product category (e.g., Electronics, Clothing)

price: Selling price of the product

stock_quantity: Available inventory quantity

Relationships:

One product can appear in many order_items

Relationship type: One-to-Many (1:M) with order_items

ENTITY: orders

Purpose:
Represents customer orders placed on the platform.

Attributes:

order_id: Unique identifier for each order (Primary Key)

customer_id: Reference to the customer who placed the order (Foreign Key)

order_date: Date the order was placed

total_amount: Total monetary value of the order

status: Current order status (e.g., Pending, Completed)

Relationships:

Each order belongs to one customer

Each order can contain many order_items

ENTITY: order_items

Purpose:
Stores line-level details of products included in each order.

Attributes:

order_item_id: Unique identifier for each order line item (Primary Key)

order_id: Reference to the associated order (Foreign Key)

product_id: Reference to the purchased product (Foreign Key)

quantity: Number of units purchased

unit_price: Price per unit at the time of purchase

subtotal: Line item total (quantity × unit_price)

Relationships:

Each order_item belongs to one order

Each order_item references one product

2. Normalization Explanation (Third Normal Form – 3NF)

The FlexiMart database schema is designed following Third Normal Form (3NF) principles to ensure data integrity, eliminate redundancy, and prevent anomalies.

In this design, each table represents a single entity, and all non-key attributes depend only on the primary key. For example, in the customers table, attributes such as first_name, last_name, email, and city depend solely on customer_id. There are no transitive dependencies, as customer-related attributes are not stored in the orders table.

Functional dependencies are clearly defined:

customer_id → first_name, last_name, email, phone, city, registration_date

product_id → product_name, category, price, stock_quantity

order_id → customer_id, order_date, total_amount, status

order_item_id → order_id, product_id, quantity, unit_price, subtotal

The design avoids update anomalies by ensuring that product prices and customer details are stored in only one place. Insert anomalies are prevented because new customers, products, or orders can be added independently without requiring related records. Delete anomalies are avoided because deleting an order does not remove customer or product information.

By separating transactional data (orders, order_items) from master data (customers, products), the schema achieves high consistency, scalability, and maintainability, making it well-suited for analytical and operational workloads.