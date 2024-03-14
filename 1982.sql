--¿Cuantás películas tiene nuestra base de datos para el año 1982?

SELECT COUNT(*) cantidad_de_peliculas
FROM movies
WHERE year=1982;