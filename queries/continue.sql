with aux as
(
SELECT
	distinct
	sellers.seller_id,
	review_score,
	orders.order_id AS number_orders
FROM
	olist.olist_order_reviews_dataset reviews
	LEFT JOIN olist.olist_orders_dataset orders
	ON reviews.order_id = orders.order_id
	LEFT JOIN olist.olist_order_items_dataset items
	ON orders.order_id = items.order_id
	LEFT JOIN olist.olist_sellers_dataset sellers
	ON items.seller_id = sellers.seller_id
)
select
*
from aux
