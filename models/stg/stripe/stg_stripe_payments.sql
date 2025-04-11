select
    id as id,
    orderid as order_id,
    amount,
    status

from {{ source('stripe', 'stripe_payments') }}