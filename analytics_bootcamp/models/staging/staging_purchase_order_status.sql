with cte_purchase_order_status as (
    select * from {{source('northwind', 'purchase_order_status')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_purchase_order_status
