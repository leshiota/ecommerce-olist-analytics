SELECT
	customer_state AS state,
	COUNT(customer_id) AS "Total_customer"
FROM
	olist.olist_customers_dataset
GROUP BY
	customer_state
ORDER BY
	COUNT(customer_id) DESC