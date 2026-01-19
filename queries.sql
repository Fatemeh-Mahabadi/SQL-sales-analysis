SELECT
  COUNT(*) AS total_rows
FROM orders;

PRAGMA table_info(orders);

SELECT
  SUM(sales) AS total_sales,
  SUM(profit) AS total_profit,
  COUNT(DISTINCT order_id) AS number_of_orders,
  ROUND(SUM(sales) * 1.0 / COUNT(DISTINCT order_id), 2) AS aov,
  ROUND((SUM(profit) * 1.0 / SUM(sales)) * 100, 2) AS profit_margin_percent
FROM orders;

SELECT
  substr(order_date, 1, 7) AS year_month,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY year_month
ORDER BY year_month;

SELECT
  region,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND((SUM(profit) * 1.0 / SUM(sales)) * 100, 2) AS profit_margin_percent
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

SELECT
  category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND((SUM(profit) * 1.0 / SUM(sales)) * 100, 2) AS profit_margin_percent
FROM orders
GROUP BY category
ORDER BY total_sales DESC;

SELECT
  product_name,
  ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
  product_name,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 20;

SELECT
  ROUND(discount, 2) AS discount_level,
  COUNT(*) AS line_count,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND((SUM(profit) * 1.0 / SUM(sales)) * 100, 2) AS profit_margin_percent
FROM orders
GROUP BY ROUND(discount, 2)
ORDER BY discount_level;

