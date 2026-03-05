with src as (
  select * 
  from read_csv_auto('../duckdb/raw/orders.csv', header=true)
),

clean as (
  select
    cast(order_id as bigint) as order_id,
    cast(order_ts as timestamp) as order_ts,
    customer_id,
    merchant_id,
    currency,
    cast(order_amount as double) as order_amount,
    cast(discount_amount as double) as discount_amount,
    cast(tax_amount as double) as tax_amount,
    cast(shipping_amount as double) as shipping_amount,
    channel,
    payment_method
  from src
)

select * from clean
