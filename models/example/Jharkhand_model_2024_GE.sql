{{ config(
    materialized="dynamic_table",
    on_configuration_change="apply" | "continue" | "fail",
    target_lag="downstream" | "<integer> seconds | minutes | hours | days",
    snowflake_warehouse="<warehouse-name>",
    refresh_mode="AUTO" | "FULL" | "INCREMENTAL",
    initialize="ON_CREATE" | "ON_SCHEDULE", 

) }}
SELECT PARTY,SUM(TOTAL_VOTES) AS TOTAL_VOTES_SECURED FROM GENERAL_ELECTIONS_2024 WHERE STATE = 'Jharkhand' GROUP BY ALL
