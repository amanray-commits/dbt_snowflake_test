WITH source_data AS (
    SELECT * FROM {{ source('RAW', 'generalelections2024') }}
)

SELECT
    CANDIDATE,
    PC_NAME,
    STATE,
    PARTY,
    SL_NO,
    TOTAL_VOTES,
FROM source_data
