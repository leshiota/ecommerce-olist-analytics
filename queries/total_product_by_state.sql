SELECT 
		customer_state AS state,
		COUNT(DISTINCT customer.customer_id) total_buyer_customer,
		COUNT(items.product_id) total_sale
	FROM olist.olist_orders_dataset orders
		LEFT JOIN olist.olist_order_items_dataset items
		ON items.order_id = orders.order_id 
		INNER JOIN olist.olist_customers_dataset customer
		ON orders.customer_id = customer.customer_id
	WHERE orders.order_status = 'delivered'
	GROUP BY
		customer_state
	ORDER BY total_sale DESC
