{% snapshot track_candidates %}
    {{
        config(
          target_schema='ELECTION_SCHEMA',
          unique_key=['CANDIDATE','STATE','SL_NO','PC_NO'],
          strategy='check',
          check_cols=['PARTY']
        )
    }}

SELECT * FROM {{ ref('generalelections2024') }}

{% endsnapshot %}
