with cte_purchase_orders as (
    select * from {{source('northwind', 'purchase_orders')}}
)
select * from cte_purchase_orders
