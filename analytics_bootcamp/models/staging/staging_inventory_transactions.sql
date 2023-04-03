with cte_inventory_transactions as (

    select * from {{source('northwind', 'inventory_transactions')}}
)
select * from cte_inventory_transactions
