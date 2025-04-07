{{
    config(
        materialized='dynamic_table'
    )
}}
{{ config(
    materialized="dynamic_table",
    on_configuration_change="apply",
    target_lag="70 seconds",
    snowflake_warehouse="COMPUTE_WH",
    refresh_mode="INCREMENTAL",
    initialize="ON_CREATE", 

) }}
-->>>>>>> 0a79b70472775df9216b47bbe9cc81a47eecb928
SELECT PARTY,SUM(TOTAL_VOTES) AS TOTAL_VOTES_SECURED FROM GENERAL_ELECTIONS_2024 WHERE STATE = 'Jharkhand' GROUP BY ALL
