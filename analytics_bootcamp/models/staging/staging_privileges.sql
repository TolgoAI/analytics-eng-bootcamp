with cte_privileges as (

    select * from {{source('northwind', 'privileges')}}
)
select * from cte_privileges
