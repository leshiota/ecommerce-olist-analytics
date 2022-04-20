SELECT
	seller_state AS state,
	COUNT(DISTINCT seller_id) AS "Total_seller"
FROM
	olist.olist_sellers_dataset
GROUP BY
	seller_state
ORDER BY
	COUNT(seller_id) DESC
