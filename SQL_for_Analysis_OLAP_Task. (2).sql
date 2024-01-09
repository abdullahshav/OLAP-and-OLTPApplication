SELECT p.prod_category, SUM(c.unit_price) AS total_sales_amount
FROM sh.sales s
JOIN sh.products p ON s.prod_id = p.prod_id
JOIN sh.costs c ON p.prod_id = c.prod_id
WHERE s.time_id BETWEEN '1999-01-01' AND '1999-06-06'
GROUP BY p.prod_category;

SELECT co.country_subregion, AVG(s.quantity_sold) AS average_sales_quantity
FROM sh.products p
JOIN sh.sales s ON p.prod_id = s.prod_id
JOIN sh.customers c ON s.cust_id = c.cust_id 
JOIN sh.countries co ON c.country_id = co.country_id
WHERE p.prod_id = 40--
GROUP BY co.country_subregion;

SELECT c.cust_id, c.cust_first_name, c.cust_last_name, SUM(s.amount_sold) AS total_sales_amount
FROM sh.sales s
JOIN sh.customers c ON s.cust_id = c.cust_id
GROUP BY c.cust_id, c.cust_first_name, c.cust_last_name
ORDER BY total_sales_amount DESC
LIMIT 5;