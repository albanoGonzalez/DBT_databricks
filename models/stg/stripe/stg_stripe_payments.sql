select
    id as id,
    orderid as order_id,
    paymentmethod,
    --amount is stored in cents, transform to dollars
    {{cents_to_dollars('amount')}} as amount,
    status, 
    created_timestamp

from {{ source('stripe', 'stripe_payments') }}