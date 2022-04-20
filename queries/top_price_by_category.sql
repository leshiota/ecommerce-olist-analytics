SELECT 
	product_category_name,
	price
FROM olist.olist_order_items_dataset AS item
	RIGHT JOIN olist.olist_orders_dataset AS orders
	ON item.order_id = orders.order_id INNER JOIN
	olist.olist_products_dataset AS products
	ON item.product_id = products.product_id
WHERE orders.order_status = 'delivered'
ORDER BY item.price DESC