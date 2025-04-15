{% snapshot snap_payments %}

{% set new_schema = target.schema + '_snapshot' %}

    {{
        config(
            target_schema= new_schema,
            target_database='hive_metastore',
            unique_key='id',
            strategy='timestamp',
            updated_at='created_timestamp'
        )
    }}

select * from hive_metastore.{{target.schema}}.stripe_payments
{% endsnapshot %}