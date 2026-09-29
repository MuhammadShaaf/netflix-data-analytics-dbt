WITH src_scores AS(
    SELECT * FROM {{ ref('source_genome_scores') }}
)

SELECT
    movie_Id,
    tag_Id,
    ROUND(relevance, 4) AS relevance_score
FROM src_scores
WHERE relevance > 0