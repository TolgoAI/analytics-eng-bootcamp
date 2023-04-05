{{ config(
    materialized="view",
    schema="dwh_northwind"
) }}

with cte_suppliers as (
    select * from {{source ('northwind', 'suppliers')}}
)
select * from cte_suppliers
