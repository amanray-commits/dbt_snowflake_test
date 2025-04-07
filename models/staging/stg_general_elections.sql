select * from {{ source('ELECTION_SCHEMA', 'GENERAL_ELECTIONS_2024') }}
