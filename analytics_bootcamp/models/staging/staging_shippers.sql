with cte_shippers as (
    select * from {{source('northwind', 'shippers')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_shippers
