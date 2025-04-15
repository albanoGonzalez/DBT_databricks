select
    id as id,
    orderid as order_id,
    paymentmethod,
    amount,
    status, 
    created_timestamp

from {{ source('stripe', 'stripe_payments') }}