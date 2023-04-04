with cte_privileges as (

    select * from {{source('northwind', 'privileges')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_privileges
