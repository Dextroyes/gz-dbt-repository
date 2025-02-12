{% macro margin_percent(revenue, purchase_cost) %}

        -- Calcul de la marge brute
        --  {{ revenue }} - {{ purchase_cost }} as margin,


        -- Calcul du pourcentage de marge
        CASE
            WHEN {{ revenue }} != 0 THEN
                ROUND(({{ revenue }} - {{ purchase_cost }}) / {{ revenue }} * 100,2)
            ELSE
                NULL
        END AS margin_percent

{% endmacro %}
