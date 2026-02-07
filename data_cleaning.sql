ALTER TABLE superstore
CHANGE `ï»¿Row ID` row_id INT,
CHANGE `Order ID` order_id VARCHAR(20),
CHANGE `Order Date` order_date DATE,
CHANGE `Shipping days` shipping_days INT,
CHANGE `weekday` weekday VARCHAR(15),
CHANGE `Month` month VARCHAR(10),
CHANGE `Ship Date` ship_date DATE,
CHANGE `Ship Mode` ship_mode VARCHAR(20),
CHANGE `Customer ID` customer_id VARCHAR(20),
CHANGE `Customer Name` customer_name VARCHAR(50),
CHANGE `Segment` segment VARCHAR(20),
CHANGE `State` state VARCHAR(30),
CHANGE `Region` region VARCHAR(20),
CHANGE `Category` category VARCHAR(30),
CHANGE `Sub-Category` sub_category VARCHAR(30),
CHANGE `Sales` sales DECIMAL(10,2),
CHANGE `Quantity` quantity INT,
CHANGE `Discount` discount DECIMAL(5,2),
CHANGE `Profit` profit DECIMAL(10,2);

UPDATE superstore
SET order_date = STR_TO_DATE(order_date, '%m-%d-%Y');

UPDATE superstore
SET ship_date = STR_TO_DATE(ship_date, '%m-%d-%Y');

ALTER TABLE superstore
ADD COLUMN ord_yr INT,
ADD COLUMN ord_month VARCHAR(15),
ADD COLUMN ord_day INT,
ADD COLUMN ord_weekday VARCHAR(15);

UPDATE superstore
SET
    ord_yr = YEAR(order_date),
    ord_month = MONTHNAME(order_date),
    ord_day = DAY(order_date),
    ord_weekday = DAYNAME(order_date);

ALTER TABLE superstore
ADD COLUMN weekend_remarks VARCHAR(20);

UPDATE superstore
SET weekend_remarks = 'Weekend'
WHERE ord_weekday IN ('Saturday','Sunday');
