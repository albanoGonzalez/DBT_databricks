{{ union_tables(

      database='hive_metastore',
      schema='default', 
      tables=['stg_stripe_payments', 'stg_orders']
      )
      
  }}

