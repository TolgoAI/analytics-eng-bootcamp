with cte_employee_privileges as (

    select * from {{source('northwind', 'employee_privileges')}}
)
select * from cte_employee_privileges
