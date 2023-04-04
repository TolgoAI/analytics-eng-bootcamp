with cte_inventory_transactions as (

    select * from {{source('northwind', 'inventory_transactions')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_inventory_transactions
