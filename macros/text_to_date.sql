{% macro text_to_date(column_name) %}
    try_to_date({{ column_name }}, 'YYYY-MM-DD')
{% endmacro %}