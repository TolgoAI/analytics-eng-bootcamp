with cte_order_details_status as (

    select * from {{source('northwind', 'order_details_status')}}
)
select * from cte_order_details_status
