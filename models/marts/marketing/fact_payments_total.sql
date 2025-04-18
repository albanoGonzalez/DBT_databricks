with payments as (
    select * from {{ ref('stg_stripe_payments') }}
)

select created_timestamp,
        paymentmethod as payment_method,
        count(*) OVER (ORDER BY created_timestamp) as payments_method_total,
        sum(amount) as amount_total
from payments
group by created_timestamp, payment_method


