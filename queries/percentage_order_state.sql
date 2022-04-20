WITH aux AS 
(

SELECT  
	DISTINCT(i.order_id),
	s.seller_id,
	s.seller_state,
	cus.customer_id,
	cus.customer_state
FROM
	olist.olist_order_items_dataset i
	INNER JOIN olist.olist_orders_dataset o
	ON i.order_id = o.order_id
	INNER JOIN olist.olist_sellers_dataset s
	ON i.seller_id = s.seller_id
	INNER JOIN olist.olist_customers_dataset cus
	ON o.customer_id = cus.customer_id
),
total_order_by_seller AS
(
SELECT
	seller_state,
	COUNT(order_id) AS total_order_delivered
	
FROM 
	aux
GROUP BY seller_state
),
aux_customer AS
(
SELECT
	COUNT(order_id) AS order_delivered_state,
	seller_state,
	customer_state
FROM 
	aux
GROUP BY seller_state,
		customer_state

)
SELECT 
	total_s.seller_state,
	customer_state,
	order_delivered_state,
	total_order_delivered
FROM total_order_by_seller total_s
	INNER JOIN aux_customer ac
	ON total_s.seller_state = ac.seller_state
	
