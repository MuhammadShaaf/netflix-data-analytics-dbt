{{config(materialized = 'table')}}

WITH raw_ratings AS(
SELECT * FROM MOVIELENS.RAW.RAW_RATINGS
)
SELECT
    userId AS user_Id,
    movieId AS movie_Id,
    rating,
    TO_TIMESTAMP_LTZ(timestamp) AS rating_timestamp
FROM raw_ratings