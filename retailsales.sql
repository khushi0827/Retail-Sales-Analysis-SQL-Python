select *from retailsales;
-- find top 10 highest revenue generated products
select  product_id , sum(sale_price) as sales 
from retailsales
group by product_id 
order by sales desc limit 10; 


-- find top 5 highest selling product in each region (best interview)
with cte as
(select product_id , region,sum(sale_price) as sales
from retailsales 
group by region ,product_id )
select *from (
select* 
,row_number() over(partition by region order by sales desc)as rn
from cte) A
where rn<=5;

-- find month over month growth comparison for 2022 and 2023 sales eg:2022 vs 2023
WITH cte AS (
    SELECT 
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(sale_price) AS sales
    FROM retailsales
    GROUP BY YEAR(order_date), MONTH(order_date)
)

SELECT 
    order_month,
    SUM(CASE 
        WHEN order_year = 2022 THEN sales 
        ELSE 0 
    END) AS sales_2022,

    SUM(CASE 
        WHEN order_year = 2023 THEN sales 
        ELSE 0 
    END) AS sales_2023

FROM cte
GROUP BY order_month
ORDER BY order_month;


-- for each category which month had highest sales
with cte as (
select category,format(order_date,'yyyyMM') as order_year_month
, sum(sale_price) as sales 
from retailsales
group by category,format(order_date,'yyyyMM')
order by category,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a
where rn=1;

-- which sub category had highest growth by profit in 2023 compare to 2022
with cte as (
select sub_category,year(order_date) as order_year,
sum(sale_price) as sales
from retailsales
group by sub_category,year(order_date)
order by year(order_date),month(order_date)
	)
, cte2 as (
select sub_category
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by sub_category
)
select *
,(sales_2023-sales_2022)
from  cte2
order by (sales_2023-sales_2022) desc;






 
 
 
