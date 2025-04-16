{% macro grant_select(schema=target.schema, role=target.role) %}

  {% set sql %}
    --check databricks grants also the role and the schema
    grant usage on schema default to {{role}}
  {% endset %}

  {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to role ' ~ role, info=True) }}
  {% do run_query(sql) %}
  {{ log('Privileges granted', info=True) }}

{% endmacro %}