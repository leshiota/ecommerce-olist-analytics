WITH orders_state AS 
(
SELECT 
	 seller_state, 
	 customer_state,
	 COUNT (DISTINCT orders.order_id) AS quantity
FROM 
	olist.olist_orders_dataset orders
INNER JOIN olist.olist_customers_dataset customers
	ON orders.customer_id = customers.customer_id
INNER JOIN olist.olist_order_items_dataset items
	ON orders.order_id = items.order_id
INNER JOIN olist.olist_sellers_dataset sellers
	ON items.seller_id = sellers.seller_id
WHERE 
	order_status = 'delivered'
GROUP BY 1,2
),

customer AS
(
SELECT 
	 customer_state,
	 COUNT (DISTINCT order_id) AS Total
FROM 
	olist.olist_orders_dataset orders
INNER JOIN olist.olist_customers_dataset customers
	ON orders.customer_id = customers.customer_id
WHERE 
	order_status = 'delivered'
GROUP BY
	customer_state
)

