WITH source_movies AS(
    SELECT * FROM {{ ref('source_movies') }}
)
SELECT 
    movie_Id,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(genres, '|') AS genres_array,
    genres
FROM source_movies