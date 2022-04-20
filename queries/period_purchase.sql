with time_day AS
(
select 
	order_id,
	order_purchase_timestamp,
case 
	when extract(hour from cast(order_purchase_timestamp as timestamp)) between 06 and 12 then 'Morning'
	when extract(hour from cast(order_purchase_timestamp as timestamp)) between 13 and 18 then 'Afternoon'
	else 'Night'
end as Period_Purchase
from 
	olist.olist_orders_dataset
)

select
	period_purchase,
	count(order_id) as Total_order
from
	time_day
group by period_purchase
