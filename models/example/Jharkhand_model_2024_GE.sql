{{ config(
    materialized="dynamic_table",
    on_configuration_change="apply"
    target_lag="10 seconds",
    snowflake_warehouse="COMPUTE_WH",
    refresh_mode="INCREMENTAL",
    initialize="ON_CREATE", 

) }}
SELECT PARTY,SUM(TOTAL_VOTES) AS TOTAL_VOTES_SECURED FROM GENERAL_ELECTIONS_2024 WHERE STATE = 'Jharkhand' GROUP BY ALL
