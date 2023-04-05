with cte_suppliers as (
    select * from {{source ('northwind', 'suppliers')}}
)
select * from cte_suppliers
