with cte_employee as (

    select * from {{source('northwind', 'employee')}}
)
select * from cte_employee
