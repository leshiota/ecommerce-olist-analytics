SELECT 
	payment_type,
	COUNT(payment_type) AS "Number_payment"
FROM
	olist.olist_order_payments_dataset
GROUP BY payment_type
ORDER BY COUNT(payment_type) DESC