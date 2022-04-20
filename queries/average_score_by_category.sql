SELECT
	product_category_name,
	ROUND(AVG(review_score), 2) AS Average_score
FROM olist.olist_order_items_dataset items
	LEFT JOIN olist.olist_products_dataset products
	ON items.product_id = products.product_id
	LEFT JOIN olist.olist_orders_dataset orders
	ON items.order_id = orders.order_id
	LEFT JOIN olist.olist_order_reviews_dataset reviews
	ON orders.order_id = reviews.order_id
GROUP BY product_category_name
ORDER BY AVG(review_score) DESC