with cte_order_status as (

    select * from {{source('northwind', 'order_status')}}
)
select * from cte_order_status
