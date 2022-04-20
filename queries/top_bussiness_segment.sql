SELECT
	business_segment,
	business_type,
	COUNT(closed.mql_id) AS total
FROM olist.olist_closed_deals_dataset AS closed
	LEFT JOIN olist.olist_marketing_qualified_leads_dataset AS marketing
	ON closed.mql_id = marketing.mql_id
GROUP BY 
	business_segment,
	business_type
ORDER BY COUNT(closed.mql_id) DESC