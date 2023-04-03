with cte_prodcuts as (
    select * from {{source('northwind', 'products')}}
)
select * from cte_prodcuts
