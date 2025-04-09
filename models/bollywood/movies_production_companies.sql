{{ config(
    materialized = 'view',
    database = 'BOLLYWOOD_DB', 
    schema = 'BOLLYWOOD_SCHEMA'
) }} 

WITH SOURCE AS 
(SELECT   
    id AS movie_id,
    try_parse_json(production_companies) AS production_companies_JSON
    from {{ ref('stg_movies') }}
)
SELECT 
    movie_id,
    VALUE:name::VARCHAR AS production_company_name
    from 
    source, lateral flatten(input=>production_companies_JSON)