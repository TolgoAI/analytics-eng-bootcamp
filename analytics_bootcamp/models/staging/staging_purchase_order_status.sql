with cte_purchase_order_status as (
    select * from {{source('northwind', 'purchase_order_status')}}
)
select * from cte_purchase_order_status
