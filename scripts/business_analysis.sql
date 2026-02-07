-- Query Number 4 : Calculate the percentage contribution of each product category to the total net revenue, excluding returned items.
with category_rev as (
select 
	pd.category,
	sum(pd.list_price * sd.quantity * (1-sd.discount)) as net_rev
from sales_data sd 
join product_data pd on sd.product_id = pd.product_id
where returned != 1
group by pd.category 
)
select 
	category,
	net_rev,
	round((net_rev * 100.0) / sum(net_rev) over(),2) as percentage 
from category_rev
order by percentage desc

----------------------------------

-- Query Number 6 : Categorize transactions into 'No Discount' and 'Discounted' based on the discount applied, and calculate the total net revenue for each category.
-- select 
-- 	case 
-- 		when discount = 0 then 'No Discount' 
-- 		when discount > 0 then 'Discounted' 
-- 		else 'Invalid'
-- 	end as category_transaction, 
-- 	sum(pd.list_price * sd.quantity * (1-sd.discount)) as net_rev 
-- from sales_data sd  
-- join product_data pd on sd.product_id = pd.product_id 
-- group by category_transaction

select 
	sd.discount, 
	count(*) as total_transaction,
	round((count(*)  / sum(count(*)) over()),2) * 100  as percentage 
from sales_data sd
join product_data pd on sd.product_id = pd.product_id
where sd.is_discount_valid = 1
group by sd.discount 

----------------------------------

--  Query Number 9 : Segment customers into 'High Value', 'Medium Value', and 'Low Value' based on their total revenue contribution.
with rev_tab as 
( 
	select 
		sd.customer_id as cust_id, 
		sum(pd.list_price * sd.quantity * (1-sd.discount)) as rev 
	from sales_data sd 
	join product_data pd on sd.product_id = pd.product_id 
	group by cust_id 
), segment as  (
select  
	cd.customer_id, 
	rev, 
	case 
		when rev > 1000 then 'High Value' 
		when rev > 100 then 'Medium Value'
		when rev <= 100 then 'Low Value' 
		else 'No Value' 
	end as segementation 
from customer_data cd 
left join rev_tab r on cd.customer_id = r.cust_id
)
select
    *, 
    count(*) over(PARTITION BY segementation) as total_customers
from segment



----------------------------------

-- Query Number 10 : Determine the percentage of customers who have made repeat purchases.
with customer_counts as 
(
	select 
		customer_id,
		count(customer_id) as total_transaction 
	from sales_data
	group by customer_id
),summary_stats as 
(
	select 
		count(customer_id) AS total_all_customers,
		count(case when total_transaction > 1 then 1 end) as repeat_customers 
	from customer_counts 
)
select 
	repeat_customers,
	total_all_customers,
	round((repeat_customers * 100.0 / total_all_customers), 2) as percentage_repeat 
from summary_stats

----------------------------------
-- query number 11 : monthly revenue growth percentage comparison
select 
	month, 
	rev as revenue_now, 
	lag(rev) over(order by month) as revenue_past, 
	round((rev - lag(rev) over(order by month)) / lag(rev) over(order by month),2) * 100 as growth_percentage 
from 
( 
	select 
		extract(MONTH from to_date(date,'YYYY-MM-DD')) as month, 
		sum(pd.list_price * sd.quantity * (1-sd.discount)) as rev 
	from sales_data sd 
	join product_data pd on sd.product_id = pd.product_id
	group by month 
	order by month 
) as growth