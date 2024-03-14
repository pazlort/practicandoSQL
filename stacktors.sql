-- Encontrá los actores que tienen "stack" en su apellido.

SELECT *
FROM actors
WHERE last_name LIKE '%stack%';