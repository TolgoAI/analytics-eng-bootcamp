with cte_invoices as (

    select * from {{source('northwind', 'invoices')}}
)
select * from cte_invoices
