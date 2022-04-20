-- Analyse the time to apporval an order considering the order_status = delivered
-- Change the data type to timestamp


SELECT 
AVG((CAST(order_approved_at AS timestamp) - CAST(order_purchase_timestamp AS timestamp)))
FROM olist.olist_orders_dataset
WHERE order_status = 'delivered'

