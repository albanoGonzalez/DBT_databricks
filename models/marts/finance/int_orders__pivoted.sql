{%- set paymentmethod = ['bank_transfer','coupon', 'credit_card','gift_card'] -%}

with payments as (
    select * from {{ ref('stg_stripe_payments') }}
),

pivoted as (
    select 
    order_id,

    {%- for method in paymentmethod %}
        sum(case when paymentmethod='{{ method }}' then amount else 0 end) as {{ method }}_amount
        {%- if not loop.last -%}
            ,
        {%- endif %}

    {%- endfor %}

    from payments
    where status = 'success'
    group by 1
)

select * from pivoted