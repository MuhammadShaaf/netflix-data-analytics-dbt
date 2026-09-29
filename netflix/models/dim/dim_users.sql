WITH ratings AS(
    SELECT DISTINCT user_Id FROM {{ ref('source_ratings') }}
),

tags AS(
    SELECT DISTINCT user_Id FROM {{ ref('source_tags') }}
)

SELECT DISTINCT user_Id
FROM(
    SELECT * FROM ratings
    UNION
    SELECT * FROM tags
)