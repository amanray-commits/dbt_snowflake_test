SELECT
    party,
    state,
    COUNT(candidate) AS total_candidates,
    SUM(
        CASE WHEN TOTAL_VOTES = '-' THEN 0
        ELSE CAST(TOTAL_VOTES AS INTEGER) 
        END
    ) AS total_votes
FROM {{ ref('stg_candidates') }}
GROUP BY party, state
