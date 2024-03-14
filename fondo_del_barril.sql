-- ¿Cuántas películas tiene IMBD de cada género ordenado por el más popular?
SELECT COUNT(*) cant_de_pelis, movies_genres.genre genero
FROM movies_genres
INNER JOIN movies
ON movies_genres.movie_id = movies.id
GROUP BY genero
ORDER BY cant_de_pelis DESC;