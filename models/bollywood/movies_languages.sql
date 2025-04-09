{{ config(
    materialized = 'view',
    database = 'BOLLYWOOD_DB', 
    schema = 'BOLLYWOOD_SCHEMA'
) }} 
WITH SOURCE AS 
(
    SELECT 
    ID AS movie_id,
    try_parse_json(spoken_languages) AS spoken_languages_json

    from 
{{ ref('stg_movies') }}
)

SELECT 
MOVIE_ID,
VALUE:iso_639_1::VARCHAR AS LANGUAGE_CODE,
VALUE:name::VARCHAR AS LANGUAGE_NAME
FROM SOURCE, LATERAL FLATTEN(input=> spoken_languages_json)