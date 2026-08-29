select distinct
    id as product_id,
    trim(name) as product_name,
    trim(category) as product_category,
    price
    
from {{ source('raw_data', 'products') }}