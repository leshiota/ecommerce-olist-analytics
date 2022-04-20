WITH seller AS
(
	SELECT
	seller_state AS UF,
	COUNT(DISTINCT seller_id) AS Total_seller
FROM
	olist.olist_sellers_dataset
GROUP BY
	seller_state
),

customer AS
(
	SELECT
	customer_state AS UF,
	COUNT(customer_id) AS Total_customer
FROM
	olist.olist_customers_dataset
GROUP BY
	customer_state
)

SELECT
	COALESCE(seller.UF,customer.UF) AS UF,
	Total_customer,
	Total_seller
FROM
	customer
	FULL JOIN seller
	ON seller.UF = customer.UF
ORDER BY total_customer DESC
