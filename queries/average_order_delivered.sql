
SELECT 
AVG((CAST(order_delivered_customer_date AS timestamp) - CAST(order_approved_at AS timestamp)))
FROM olist.olist_orders_dataset
WHERE order_status = 'delivered'