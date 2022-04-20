SELECT
	ORIGIN,
	COUNT(mql_id) AS total
FROM olist.olist_marketing_qualified_leads_dataset
GROUP BY
	origin
ORDER BY COUNT(mql_id) DESC