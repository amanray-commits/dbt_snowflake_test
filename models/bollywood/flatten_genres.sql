-- models/marts/movies_genres.sql
{{ config(
    materialized = 'view',
    database = 'BOLLYWOOD_DB', 
    schema = 'BOLLYWOOD_SCHEMA'
) }} 

with source as (
    select
        id as movie_id,
        try_parse_json(genres) as genres_json
    from {{ ref('stg_movies') }}
),

flattened as (
    select
        movie_id,
        value:id::integer as genre_id,
        value:name::string as genre_name
    from source,
    lateral flatten(input => genres_json)
)

select * from flattened
