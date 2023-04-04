with cte_order_details as (

    select * from {{source('northwind', 'order_details')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_order_details
