with cte_prodcuts as (
    select * from {{source('northwind', 'products')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_prodcuts
