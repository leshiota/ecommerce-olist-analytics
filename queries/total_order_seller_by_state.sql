WITH seller AS
(
SELECT
	seller_state AS UF_seller,
	COUNT(DISTINCT seller_id) AS Total_seller
FROM
	olist.olist_sellers_dataset
GROUP BY
	seller_state
),

delivered_order AS
(
	SELECT 
	 customer_state,
	 COUNT (order_id) AS Total
FROM 
	olist.olist_orders_dataset orders
INNER JOIN olist.olist_customers_dataset customers
	ON orders.customer_id = customers.customer_id
WHERE 
	order_status = 'delivered'
GROUP BY
	customer_state
)

SELECT 
	customer_state AS UF,
	Total,
	Total_seller
FROM delivered_order
	FULL JOIN seller 
	ON delivered_order.customer_state = seller.UF_seller
ORDER BY total DESC