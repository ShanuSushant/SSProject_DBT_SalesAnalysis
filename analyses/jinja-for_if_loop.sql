{%- set player_names = ['Virat Kohli','MS Dhoni','Rohit Sharma','Ishan Kishan','Md Shami'] -%}

{%- for i in player_names -%}
    {%- if i != "MS Dhoni" -%}
        {{- i -}}
    {% else %}
        {{ i }} is retired!!

    {% endif %}
{% endfor %}