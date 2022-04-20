with aux AS(
	SELECT 
		product_category_name,
		customer_state,
		COUNT(items.product_id) total
	FROM olist.olist_orders_dataset orders
		LEFT JOIN olist.olist_order_items_dataset items
		ON items.order_id = orders.order_id 
		INNER JOIN olist.olist_products_dataset products
		ON items.product_id = products.product_id
		INNER JOIN olist.olist_customers_dataset customer
		ON orders.customer_id = customer.customer_id
	WHERE orders.order_status = 'delivered'
	GROUP BY
		product_category_name,
		customer_state
	ORDER BY total DESC
),

top_3 AS (
SELECT
	product_category_name,
	customer_state,
	total,
	ROW_NUMBER() OVER (PARTITION BY customer_state Order by total DESC) AS top 
FROM aux
WHERE customer_state IN('SP','MG','RJ') 
ORDER BY total DESC
)

SELECT
	product_category_name,
	customer_state,
	total,
	top
FROM top_3
WHERE top <=3
ORDER BY top ASC

