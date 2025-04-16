{{ join_tables(
    database='hive_metastore',
    schema='default',
    tables=['stg_orders', 'stg_customers'],
    join_type='inner',
    join_keys=['customer_id']
) }}