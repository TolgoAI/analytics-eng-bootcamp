with cte_purchase_order_details as (
    select * from {{source('northwind', 'purchase_order_details')}}
)
select * from cte_purchase_order_details
