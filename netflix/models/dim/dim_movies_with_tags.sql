{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH movies AS (
    SELECT * FROM {{ ref('dim_movies') }}
),
tags AS (
    SELECT * FROM {{ ref('dim_genome_tags') }}
),
scores AS (
    SELECT * FROM {{ ref('fct_genome_scores') }}
)

SELECT 
    m.movie_Id,
    m.movie_title, 
    m.genres,
    t.tag_name,
    s.relevance_score
FROM movies m 
LEFT JOIN scores s ON m.movie_Id = s.movie_Id
LEFT JOIN tags t ON t.tag_Id = s.tag_Id
