with cte_shippers as (
    select * from {{source('northwind', 'shippers')}}
)
select * from cte_shippers
