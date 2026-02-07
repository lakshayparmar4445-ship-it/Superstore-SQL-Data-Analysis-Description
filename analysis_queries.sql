SELECT COUNT(*) AS total_orders FROM superstore;

SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore;

SELECT
    IFNULL(weekend_remarks,'Weekday') AS day_type,
    COUNT(*) AS order_count,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales
FROM superstore
GROUP BY day_type;

SELECT
    ord_weekday,
    COUNT(*) AS order_count,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales
FROM superstore
GROUP BY ord_weekday;

SELECT
    ord_month,
    COUNT(*) AS order_count,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY ord_month;

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

SELECT region, sub_category, total_sales
FROM (
    SELECT
        region,
        sub_category,
        SUM(sales) AS total_sales,
        RANK() OVER (PARTITION BY region ORDER BY SUM(sales) DESC) AS rnk
    FROM superstore
    GROUP BY region, sub_category
) t
WHERE rnk = 1;
