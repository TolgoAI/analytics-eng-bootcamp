with cte_source as (

    select * from {{source('northwind', 'customer')}}
)
select * from cte_source
