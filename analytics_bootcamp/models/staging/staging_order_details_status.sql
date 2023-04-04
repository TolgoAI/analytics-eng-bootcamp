with cte_order_details_status as (

    select * from {{source('northwind', 'order_details_status')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_order_details_status
