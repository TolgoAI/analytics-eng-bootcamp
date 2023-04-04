with cte_orders as (

    select * from {{source('northwind', 'orders')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_orders
