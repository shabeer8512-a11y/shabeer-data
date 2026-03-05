with src as (
  select *
  from read_csv_auto('../duckdb/raw/merchants.csv', header=true)
)

select
  merchant_id,
  merchant_name,
  vertical,
  segment
from src
