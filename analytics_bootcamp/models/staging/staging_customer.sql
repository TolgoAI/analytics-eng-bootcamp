with cte_source as (

    select * from {{source('northwind', 'customer')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_source
