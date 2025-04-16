{{ config(
    materialized = 'view',
    database = 'BOLLYWOOD_DB', 
    schema = 'BOLLYWOOD_SCHEMA'
) }} 
WITH source AS (

    SELECT
        -- Direct mappings
        id,
        imdb_id,
        title,
        original_title,
        original_language,
        overview,
        homepage,
        poster_path,
        status,
        tagline,
 
        -- Handling types and casting
        TRY_TO_DATE(release_date) AS release_date,
        budget,
        revenue,
        runtime,
        popularity,
        vote_average,
        vote_count,

        -- Booleans
        CASE 
            WHEN adult = 'True' OR adult = TRUE THEN TRUE
            ELSE FALSE
        END AS is_adult,

        CASE 
            WHEN video = 'True' OR video = TRUE THEN TRUE
            ELSE FALSE
        END AS is_video,

        -- JSON fields stored as STRING (for now)
        genres,
        production_companies,
        production_countries,
        spoken_languages,
        belongs_to_collection

    FROM {{ source('bollywood_db', 'movies_raw') }}
     

)

SELECT * FROM source where release_date is not null 
 