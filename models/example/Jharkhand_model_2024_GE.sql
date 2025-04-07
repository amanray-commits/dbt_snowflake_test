{{
    config(
        materialized='dynamic_table'
    )
}}
SELECT PARTY,SUM(TOTAL_VOTES) AS TOTAL_VOTES_SECURED FROM GENERAL_ELECTIONS_2024 WHERE STATE = 'Jharkhand' GROUP BY ALL
