select distinct
    id as customer_id,
    trim(name) as customer_name,
    email,
    country
    
from {{ source('raw_data', 'customers') }}
        