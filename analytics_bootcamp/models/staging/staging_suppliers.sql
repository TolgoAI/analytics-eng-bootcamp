with cte_suppliers as (
    select * from {{source ('northwind', 'suppliers')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_suppliers
