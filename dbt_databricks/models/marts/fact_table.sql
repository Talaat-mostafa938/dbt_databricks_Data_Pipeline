select  

    OI.ITEM_ID,
    O.ORDER_ID,
    O.CUSTOMER_ID,     
    OI.PRODUCT_ID,     
    
    O.ORDER_DATE,
    
    OI.QUANTITY,
    OI.UNIT_PRICE,
    OI.TOTAL_PRICE

from {{ ref('stg_orders') }} O
inner join {{ ref('stg_order_items') }} OI
on O.ORDER_ID = OI.ORDER_ID