select distinct
    id as order_id,
    customer_id,
    cast(order_date as date) as order_date,
    total_amount,
    trim(status) as order_status
    
from {{ source('raw_data', 'orders') }}
    