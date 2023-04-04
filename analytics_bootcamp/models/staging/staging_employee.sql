with cte_employee as (

    select * from {{source('northwind', 'employee')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from cte_employee
