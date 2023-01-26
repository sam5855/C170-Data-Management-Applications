CREATE TABLE EMPLOYEE (
  employee_id INT,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  hire_date DATE,
  job_title VARCHAR(30),
  shop_id INTEGER,
  PRIMARY KEY (employee_id)
  );


CREATE TABLE COFFEE_SHOP (
  shop_id INT, 
  shop_name VARCHAR(50),
  city VARCHAR(50),
  state CHAR(2),
  PRIMARY KEY (shop_id)
  );

  
CREATE TABLE COFFEE (
  coffee_id INT, 
  shop_id INT, 
  supplier_id INT, 
  coffee_name VARCHAR(30),
  price_per_pound NUMERIC(5,2),
  PRIMARY KEY (coffee_id),
  FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP (shop_id) 
  );

  
CREATE TABLE SUPPLIER (
  supplier_id INT, 
  company_name VARCHAR(50),
  country VARCHAR(30),
  sales_contact_name VARCHAR(60),
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (supplier_id)
  );
 
 

ALTER TABLE EMPLOYEE ADD FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP (shop_id);
ALTER TABLE COFFEE ADD FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP (shop_id);
ALTER TABLE COFFEE ADD FOREIGN KEY (supplier_id) REFERENCES SUPPLIER (supplier_id);


INSERT INTO SUPPLIER (supplier_id, company_name, country, sales_contact_name, email)
  VALUES
  (5855, 'Best Beans', 'United States of America', 'Evan', 'evan@bb.com'),
  (1967, 'La Roast', 'France', 'Cheri', 'cmcmasters@lr.com'),
  (2023, 'Cuban Grounds', 'Brazil', 'Roy', 'roy@cubangrounds.com');


INSERT INTO COFFEE_SHOP (shop_id, shop_name, city, state)
  VALUES
  (100, 'Main St Coffee', 'Deland', 'FL'),
  (200, 'FoxTail Coffee', 'Columbus', 'OH'),
  (300, 'Grounds Up', 'Orlando', 'FL');


INSERT INTO COFFEE (coffee_id, shop_id, supplier_id, coffee_name, price_per_pound)
  VALUES
  (22, 100, 1967, 'Dark Roast', 10.00),
  (33, 200, 1967, 'Blondie', 25.00),
  (44, 200, 2023, 'Light Blend', 15.00),
  (55, 300, 5855, 'Medium Roast', 12.00);


INSERT INTO EMPLOYEE (employee_id, first_name, last_name, hire_date, job_title, shop_id)
  VALUES
  (1, 'Sam', 'McMasters', '2020-01-01', 'Barista', 100),
  (2, 'Emaly', 'Howell', '2010-05-25', 'Manager', 100),
  (3, 'Cameron', 'Forshey', '2023-07-21', 'Janitor', 300);



CREATE VIEW EMPLOYEE_VIEW
AS SELECT 
   employee_id,
   CONCAT(first_name, " ", last_name) AS employee_full_name,
   hire_date, 
   job_title,
   shop_id
   FROM EMPLOYEE;
  


ALTER TABLE COFFEE
ADD INDEX COFFEE_IDX (coffee_name);


SELECT first_name, last_name, hire_date
FROM EMPLOYEE
WHERE hire_date > '2000-01-01';


SELECT EMPLOYEE.first_name, COFFEE_SHOP.shop_name, COFFEE.coffee_name
FROM EMPLOYEE
JOIN COFFEE_SHOP ON EMPLOYEE.shop_id = COFFEE_SHOP.shop_id
JOIN COFFEE ON COFFEE.shop_id = COFFEE_SHOP.shop_id;












