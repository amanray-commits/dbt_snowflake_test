{% snapshot movies_genres_snapshot %}

{{
    config(
      target_database='BOLLYWOOD_DB',
      target_schema='BOLLYWOOD_SCHEMA',              
      unique_key='movie_id || genre_id',     
      strategy='check',                       
      check_cols=['genre_name'],
      materialized='snapshot'               
    )
}}

SELECT
    movie_id,
    genre_id,
    genre_name
FROM {{ ref('flatten_genres') }}

{% endsnapshot %}
