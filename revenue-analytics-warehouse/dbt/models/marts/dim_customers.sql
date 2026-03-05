with src as (
  select *
  from read_csv_auto('../duckdb/raw/customers.csv', header=true)
)

select
  customer_id,
  cast(signup_date as date) as signup_date,
  state,
  acquisition_channel
from src
