SELECT 
	item.product_id, 
	product_category_name,
	COUNT(item.product_id) AS "Mais vendidos" 
FROM 
	olist.olist_order_items_dataset item
INNER JOIN olist.olist_products_dataset products
	ON item.product_id = products.product_id
GROUP BY 
	item.product_id, 
	product_category_name
ORDER BY 3 DESC

