WITH raw_genome_scores AS(
SELECT * FROM MOVIELENS.RAW.RAW_GENOME_SCORES
)
SELECT
    movieId AS movie_Id,
    tagId AS tag_Id,
    relevance
FROM raw_genome_scores