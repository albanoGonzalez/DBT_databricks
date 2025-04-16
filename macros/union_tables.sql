{%- macro union_tables(database, schema, tables) -%}

    {%- for table in tables %}
        select order_id from {{ database }}.{{ schema }}.{{ table }}
        {%- if not loop.last %}
        union all
        {%- endif %}
    {%- endfor %}
  
{%- endmacro -%}




