SELECT 
	 customer_state,
	 COUNT (order_id) AS "Total"
FROM 
	olist.olist_orders_dataset orders
INNER JOIN olist.olist_customers_dataset customers
	ON orders.customer_id = customers.customer_id
WHERE 
	order_status = 'delivered'
GROUP BY
	customer_state
ORDER BY COUNT (order_id) DESC


