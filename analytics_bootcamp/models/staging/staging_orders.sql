with cte_orders as (

    select * from {{source('northwind', 'orders')}}
)
select * from cte_orders
