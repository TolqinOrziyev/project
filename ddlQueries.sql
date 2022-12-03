Задание 1.
1.Написать примерный DDL для каждого из таблиц

###TABLE productlines


CREATE TABLE product_lines 
(
  product_line VARCHAR(50) NOT NULL PRIMARY KEY,
  text_description TEXT DEFAULT NULL,
  html_description TEXT,
  image bytea );

INSERT INTO product_lines VALUES ('Drink product',
'Something smth smth', 'htps://pepsi.com', NULL)

INSERT INTO product_lines VALUES ('Laptop',
'laptop computer, or notebook computer is a small, portable personal computer', 
'htps://laptop.com', NULL)

INSERT INTO product_lines VALUES ('Book',
'book is a medium for recording information in the form of writing or images, 
typically composed of many pages bound together and protected by a cover', 
'htps://book.com', NULL)


###TABLE products


CREATE TABLE products( 
  product_code VARCHAR(25) NOT NULL PRIMARY KEY, 
  product_name VARCHAR(100) NOT NULL, 
  product_line VARCHAR(100) NOT NULL REFERENCES productlines (product_line), 
  product_scale VARCHAR(100) NOT NULL, 
  product_vendor VARCHAR(100) NOT NULL, 
  product_description TEXT NOT NULL, 
  quantity_in_stock INT NOT NULL, 
  buy_price NUMERIC(10,3) NOT NULL, 
  MSRP NUMERIC(10,3) NOT NULL
); 

INSERT INTO products VALUES(0112356222, 'Pepsi', 'Drink product', '7:10', 
'Korzinka', 'carbonated soft drink', 2000, 9399, 8799);

INSERT INTO products VALUES(0112356255, 'Coca Cola', 'Drink product', '10:10', 
'Korzinka', 'carbonated soft drink', 6000, 9399.999, 8891);

INSERT INTO products VALUES(01109816222, 'Dexp', 'Laptop', '9:10', 
'Texnomart', 'Intel, RAM 8', 200, 9399999, 8799999);

INSERT INTO products VALUES(21129816222, 'Why Nations Fail', 'Book', '10:10', 
'Asaxiy', 'The Origins of Power, Prosperity, and Poverty', 456, 93990, 91999);



###TABLE offices


CREATE TABLE offices( 
  office_code VARCHAR(25) NOT NULL PRIMARY KEY, 
  city VARCHAR(50) NOT NULL,
  phone INT NOT NULL,
  address_line_1 VARCHAR(150) NOT NULL,
  address_line_2 VARCHAR(150) NOT NULL,
  state VARCHAR(150) DEFAULT NULL,
  country VARCHAR(150) NOT NULL,
  postal_code VARCHAR(25) NOT NULL,
  territory Varchar(25)NOT NULL);


INSERT INTO offices ("office_code", "city", "phone", "address_line_1",
"address_line_2", "country", "postal_code", "territory") 
VALUES(1, 'Tashkent', 998991234567, 'Mirobod 47', 'Olmazor 34',
 'Uzbekistan', 111001, '447.8 km.kv')

INSERT INTO offices ("office_code", "city", "phone", "address_line_1",
"address_line_2", "country", "postal_code", "territory") 
VALUES(2, 'Bukhara', '+998991234577', 'Yangiobod 66', 'Yashnobod 31',
 'Uzbekistan', 111010, '447.8 km.kv')


###TABLE employees


CREATE TABLE employees(
	employee_number INT NOT NULL PRIMARY KEY,
	last_name VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	extension VARCHAR(25) NOT NULL,
	email VARCHAR(50) NOT NULL,
	office_code VARCHAR(25) NOT NULL REFERENCES offices (office_code),
	reports_to INT NOT NULL REFERENCES employees (employee_number),
	job_title VARCHAR(50) NOT NULL
);


INSERT INTO employees VALUES (100,'Eldor','Shomurodov','something',
'shoma@gmail.com', '1', 11, 'HR')

INSERT INTO employees VALUES (101,'Odil','Aliyev','smth','odil@mail.ru',
'2', 101, 'Manager')

INSERT INTO employees VALUES (102,'Ibrohim','Ahmedov','smth',
'Ibrohim@gmail.com', '1', 102, 'Data scientist')



###TABLE customers


CREATE TABLE customers(
	customer_number INT NOT NULL PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	customer_last_name VARCHAR(50) NOT NULL,
	customer_first_name VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL, 
	address_line_1 VARCHAR(150) NOT NULL,
        address_line_2 VARCHAR(150) NOT NULL,
	city VARCHAR(50) NOT NULL,
	state VARCHAR(150) DEFAULT NULL,
        postal_code" VARCHAR(25) NOT NULL,
	country VARCHAR(150) NOT NULL,
	sales_rep_employee_number" INT NOT NULL REFERENCES employees (employee_number),
	credit_limit NUMERIC(10,3) NOT NULL);



INSERT INTO customers ("customer_number", "customer_name", "customer_last_name", 
"customer_first_name", phone, "address_line_1", "address_line_2", city, "postal_code", 
country, "sales_rep_employee_number", "credit_limit") 
VALUES (1, 'Oybek Abdullayev', 'Bozorov', 'Erkin', 998945867564, 
'Mirobod 11', 'Mirobod 33', 'Tashkent', 11012, 'Uzbekistan', 100, 10001.889)

INSERT INTO customers ("customer_number", "customer_name", "customer_last_name", 
"customer_first_name", phone, "address_line_1", "address_line_2", city, "postal_code", 
country, "sales_rep_employee_number", "credit_limit") 
VALUES (2, 'Umidjon', 'Kamol', 'Erkin', 998941200987, 'Mirzaobod 31', 
'Chorsu 100', 'Samarkand', 11000, 'Uzbekistan', 101, 20500.889)

INSERT INTO customers ("customer_number", "customer_name", "customer_last_name", 
"customer_first_name", phone, "address_line_1", "address_line_2", city, "postal_code", 
country, "sales_rep_employee_number", "credit_limit") 
VALUES (3, 'Shohruh Ali', 'Ilhom', 'Jamshid', 998978880505, 
'Sergeli 99', 'Sergeli 1', 'Tashkent', 111000, 'Uzbekistan', 102, 155000.111)



###TABLE orders


CREATE TABLE orders (
	order_number INT NOT NULL PRIMARY KEY,
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE NOT NULL,
	status Varchar(25),
	comments TEXT,
	customer_number INT NOT NULL REFERENCES customers (customer_number)
);


INSERT INTO orders(order_number, order_date, required_date, shipped_date,
				   status, comments, customer_number)
				   VALUES(1, '01-11-2022', '01-11-2022', '01-11-2022', 'SHIPPED', 'some comments', 1);
INSERT INTO orders(order_number, order_date, required_date, shipped_date,
				   status, comments, customer_number)
				   VALUES(2, '01-10-2022', '01-11-2022', '01-12-2022', 'SHIPPING', 'some comments', 1);	   
INSERT INTO orders(order_number, order_date, required_date, shipped_date,
				   status, comments, customer_number)
				   VALUES(3, '01-10-2022', '01-10-2022', '01-10-2022', 'DELIVERED', 'some comments', 2);



###TABLE orderdetails


CREATE TABLE order_details (
	order_detail_id INT NOT NULL PRIMARY KEY,
	order_number INT NOT NULL REFERENCES orders (order_number),
	product_code VARCHAR(25) NOT NULL REFERENCES products (product_code),
	quantity_ordered INT NOT NULL,
	price_each NUMERIC(10,3) NOT NULL, 
	oder_line_number INT NOT NULL
);


INSERT INTO order_details(order_detail_id, order_number, product_code, 
						  quantity_ordered, price_each, order_line_number) 
	VALUES(1, 1, 0112356222, 2, 1000, 23213);
INSERT INTO order_details(order_detail_id, order_number, product_code, 
						  quantity_ordered, price_each, order_line_number) 
	VALUES(4, 1, 0112356222, 5, 5000, 93213);
INSERT INTO order_details(order_detail_id, order_number, product_code, 
						  quantity_ordered, price_each, order_line_number) 
	VALUES(2, 2, 0112356255, 3, 5000, 233313);
INSERT INTO order_details(order_detail_id, order_number, product_code, 
						  quantity_ordered, price_each, order_line_number) 
	VALUES(3, 3, 01109816222, 5, 5000, 4553313);




###TABLE payments


CREATE TABLE payments (
	payments_id INT NOT NULL PRIMARY KEY,
	customer_number INT NOT NULL REFERENCES customers (customer_number),
	check_number INT NOT NULL,
	UNIQUE (check_number),
	payment_date DATE NOT NULL,
	amount NUMERIC(10,3) NOT NULL
);


INSERT INTO payments(payments_id, customer_number, check_number, payment_date, amount)
	VALUES(1, 1, 123, '12-11-2022', 5000);
INSERT INTO payments(payments_id, customer_number, check_number, payment_date, amount)
	VALUES(2, 1, 12343, '12-10-2022', 10000);
INSERT INTO payments(payments_id, customer_number, check_number, payment_date, amount)
	VALUES(3, 2, 12543, '12-09-2022', 3000);



2. Написать запросы для
	a. Расчета оборота от одного потребителя

SELECT SUM(pm.amount) 
FROM payments as pm 
LEFT JOIN customers as ct ON ct.customer_number=pm.customer_number
WHERE ct.customer_number=3

	b. Расчета частотности заказов одного потребителя в неделю

SELECT pm.payment_date, SUM(pm.amount) 

FROM payments as pm 

LEFT JOIN customers as ct ON ct.customer_number=pm.customer_number

WHERE ct.customer_number=1 

GROUP BY pm.payment_date

	c. Расчета оборота по дате платежа (изменено)


SELECT pm.payment_date, SUM(pm.amount) 

FROM payments as pm 

GROUP BY pm.payment_date


