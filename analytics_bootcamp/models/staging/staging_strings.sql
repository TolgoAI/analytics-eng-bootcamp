with cte_strings as(
    select * from {{source('northwind', 'strings')}}
)
select * from cte_strings
