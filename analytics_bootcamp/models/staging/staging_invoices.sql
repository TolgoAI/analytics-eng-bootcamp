with cte_invoices as (

    select * from {{source('northwind', 'invoices')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_invoices
