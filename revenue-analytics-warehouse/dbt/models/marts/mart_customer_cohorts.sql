with orders as (
  select customer_id, order_date
  from {{ ref('fct_orders') }}
),

first_order as (
  select customer_id, min(order_date) as first_order_date
  from orders
  group by 1
),

cohorts as (
  select
    o.customer_id,
    f.first_order_date,
    date_trunc('month', f.first_order_date) as cohort_month,
    date_trunc('month', o.order_date) as activity_month,
    date_diff(
      'month',
      date_trunc('month', f.first_order_date),
      date_trunc('month', o.order_date)
    ) as month_number
  from orders o
  join first_order f using (customer_id)
)

select
  cohort_month,
  month_number,
  count(distinct customer_id) as active_customers
from cohorts
group by 1,2
order by 1,2
