-- warehouse_data.sql
-- Database: fleximart_dw
-- Sample data for dimensions and fact table

-- =========================
-- dim_date (30 dates: Jan–Feb 2024)
-- =========================
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,true),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,true),
(20240125,'2024-01-25','Thursday',25,1,'January','Q1',2024,false),
(20240131,'2024-01-31','Wednesday',31,1,'January','Q1',2024,false),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240220,'2024-02-20','Tuesday',20,2,'February','Q1',2024,false),
(20240228,'2024-02-28','Wednesday',28,2,'February','Q1',2024,false);

-- =========================
-- dim_product (15 products, 3 categories)
-- =========================
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop','Electronics','Computers',65000),
('P002','Smartphone','Electronics','Mobile',35000),
('P003','Headphones','Electronics','Accessories',2500),
('P004','LED TV','Electronics','Entertainment',48000),
('P005','Tablet','Electronics','Mobile',22000),
('P006','Office Chair','Furniture','Office',7500),
('P007','Dining Table','Furniture','Home',30000),
('P008','Sofa','Furniture','Home',55000),
('P009','Bookshelf','Furniture','Storage',4200),
('P010','Bed','Furniture','Home',60000),
('P011','Notebook','Stationery','Paper',120),
('P012','Pen Pack','Stationery','Writing',300),
('P013','Printer Paper','Stationery','Paper',450),
('P014','Office File','Stationery','Office',180),
('P015','Desk Organizer','Stationery','Office',950);

-- =========================
-- dim_customer (12 customers, 4 cities)
-- =========================
INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Amit Shah','Mumbai','Maharashtra','Retail'),
('C002','Neha Verma','Delhi','Delhi','Retail'),
('C003','Rahul Mehta','Ahmedabad','Gujarat','Corporate'),
('C004','Priya Nair','Kochi','Kerala','Retail'),
('C005','Suresh Iyer','Mumbai','Maharashtra','Corporate'),
('C006','Anita Rao','Bengaluru','Karnataka','Retail'),
('C007','Vikram Singh','Delhi','Delhi','Corporate'),
('C008','Pooja Kulkarni','Pune','Maharashtra','Retail'),
('C009','Rohan Das','Kolkata','West Bengal','Retail'),
('C010','Sneha Patil','Pune','Maharashtra','Corporate'),
('C011','Arjun Malhotra','Chandigarh','Punjab','Retail'),
('C012','Kavita Joshi','Jaipur','Rajasthan','Retail');

-- =========================
-- fact_sales (40 transactions, realistic patterns)
-- =========================
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES
(20240106,1,1,2,65000,2000,128000),
(20240107,2,2,1,35000,0,35000),
(20240113,3,3,3,2500,300,7200),
(20240114,4,4,1,48000,2000,46000),
(20240120,5,5,2,22000,1000,43000),
(20240121,6,6,4,7500,500,29500),
(20240125,7,7,1,30000,0,30000),
(20240131,8,8,1,55000,3000,52000),
(20240203,9,9,5,4200,0,21000),
(20240204,10,10,1,60000,5000,55000),
(20240210,11,11,10,120,0,1200),
(20240211,12,12,8,300,200,2200),
(20240214,13,1,6,450,0,2700),
(20240220,14,2,7,180,100,1160),
(20240228,15,3,3,950,0,2850),
(20240105,1,4,1,65000,1000,64000),
(20240108,2,5,2,35000,1500,68500),
(20240109,3,6,4,2500,0,10000),
(20240110,4,7,1,48000,0,48000),
(20240111,5,8,2,22000,0,44000),
(20240112,6,9,3,7500,300,22200),
(20240115,7,10,1,30000,0,30000),
(20240120,8,11,2,55000,4000,106000),
(20240121,9,12,6,4200,0,25200),
(20240201,10,1,1,60000,2000,58000),
(20240202,11,2,12,120,0,1440),
(20240203,12,3,5,300,0,1500),
(20240204,13,4,4,450,100,1700),
(20240205,14,5,10,180,200,1600),
(20240206,15,6,2,950,0,1900),
(20240210,1,7,1,65000,3000,62000),
(20240211,2,8,2,35000,0,70000),
(20240214,3,9,6,2500,500,14500),
(20240220,4,10,1,48000,0,48000),
(20240228,5,11,3,22000,2000,64000),
(20240106,6,12,5,7500,500,37000),
(20240107,7,1,2,30000,1000,59000),
(20240113,8,2,1,55000,0,55000),
(20240114,9,3,7,4200,0,29400),
(20240120,10,4,1,60000,4000,56000);
