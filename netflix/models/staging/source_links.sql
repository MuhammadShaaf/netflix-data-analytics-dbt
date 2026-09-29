WITH raw_links AS(
SELECT * FROM MOVIELENS.RAW.RAW_LINKS
)
SELECT
    movieId AS movie_Id,
    imdbId AS imdb_Id,
    tmdbId AS tmdb_Id
FROM raw_links