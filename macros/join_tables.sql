{%- macro join_tables(database, schema, tables, join_type='inner', join_keys=[]) -%}
    {%- set base_table = tables[0] -%}
    select t0.*, first_name
    from {{ database }}.{{ schema }}.{{ base_table }} as t0
    {%- for table in tables[1:] %}
        {{ join_type }} join {{ database }}.{{ schema }}.{{ table }} as t{{ loop.index }}
        on
            {%- for key in join_keys %}
                t0.{{ key }} = t{{ loop.index }}.{{ key }}{% if not loop.last %} and {% endif %}
            {%- endfor %}
    {%- endfor %}
{%- endmacro %}