with cte_order_tax_status as (

    select * from {{source('northwind', 'order_tax_status')}}
)
select * from cte_order_tax_status
