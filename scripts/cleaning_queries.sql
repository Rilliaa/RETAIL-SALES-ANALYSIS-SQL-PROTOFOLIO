/*
SQL Script to Import Data for Messy Retail Fashion Dataset 
from CSV Files to PostgreSQL Database
Author: Rio Liando Anggeri
*/


-- Import Data START
COPY sales_data(transaction_id, date, product_id, store_id, customer_id, quantity, discount, returned)
FROM 'E:\Tes Projek\Portofolio Data Analyst\Dataset Messy Retail Fashion Data\sales_data.csv'
DELIMITER ','
CSV HEADER;

COPY customer_data(customer_id, age, gender, city, email)
FROM 'E:\Tes Projek\Portofolio Data Analyst\Dataset Messy Retail Fashion Data\customer_data.csv'
DELIMITER ','
CSV HEADER;

COPY store_data(store_id, store_name, region, store_size_m2)
FROM 'E:\Tes Projek\Portofolio Data Analyst\Dataset Messy Retail Fashion Data\store_data.csv'
DELIMITER ','
CSV HEADER;

COPY product_data(product_id, category, color, size, season, supplier, cost_price, list_price)
FROM 'E:\Tes Projek\Portofolio Data Analyst\Dataset Messy Retail Fashion Data\product_data.csv'
DELIMITER ','
CSV HEADER;
-- Import Data END


------------------------------------

-- Cleaning Process START 



-- Creating new category for unknown START

insert into product_data (product_id, category, color, size, season, supplier, cost_price, list_price)
values ('P000000', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', null, null);

INSERT INTO store_data (store_id, store_name, region, store_size_m2)
VALUES ('S000', 'Unknown', 'Unknown', NULL);

INSERT INTO customer_data (customer_id, age, gender, city, email)
VALUES ('C000000', NULL, 'Unknown', 'Unknown', 'Unknown');
-- Creating new category for unknown END


-- 1. Set missing values from customer_id in sales_data to 'C000000'
update sales_data
set customer_id = 'C000000'
WHERE customer_id is null or customer_id = '???';

-- 2. change all the invalid store_id in sales_data to 'S000' (like s999)
UPDATE sales_data
set store_id = 'S000'
where store_id = 'S999' OR store_id IS NULL OR store_id = '???';

-- 3. change all the invalid product_id in sales_data to 'P000000' (like p999999)
UPDATE sales_data
set product_id = 'P000000'
where product_id = 'P999999' OR product_id IS NULL OR product_id = '???';

-- 4. Set missing vales in discount into 0 (mode) and add new column is_discount_valid 0 for no 1 for yes
alter table sales_data
add column is_discount_valid INT;

update sales_data
set is_discount_valid = 1
where discount is not null;

update sales_data
set discount = 0, is_discount_valid = 0
where discount is null;

-- 5. Set all the invalid gender values into unknown in customer_data (such as ??? or null)
UPDATE customer_data
SET gender = 'Unknown'
WHERE gender IS NULL OR gender = '???';

-- 6 Set all the missing values in email column in customer_data to 'Unknown'
UPDATE customer_data
SET email = 'Unknown'
WHERE email IS NULL OR email = '???';

-- 7. Set all the missing values in category column in product_data to 'Unknown' (such as ??? or null)
UPDATE product_data
SET category = 'Unknown'
WHERE category IS NULL OR category = '???';

-- 8. Set all the missing values in color column in product_data to 'Unknown' (such as ??? or null)
UPDATE product_data
SET color = 'Unknown'
WHERE color IS NULL OR color = '???';

--9. set list price and cost price in product_data for product_id 'P000000' to median values
WITH median_values AS (
    SELECT 
        percentile_cont(0.5) WITHIN GROUP (ORDER BY cost_price) AS m_cost,
        percentile_cont(0.5) WITHIN GROUP (ORDER BY list_price) AS m_list
    FROM product_data
    WHERE product_id != 'P000000' 
      AND cost_price IS NOT NULL
)
UPDATE product_data
SET 
    cost_price = (SELECT m_cost FROM median_values),
    list_price = (SELECT m_list FROM median_values)
WHERE product_id = 'P000000';



-- Cleaning Process END