-- ¿Cúales son los 10 nombres más populares?

SELECT COUNT(first_name) c, first_name
FROM actors
GROUP BY first_name
ORDER BY c DESC
LIMIT 10;

-- ¿Cúales son los 10 apellidos más populares?

SELECT COUNT(last_name) c, last_name
FROM actors
GROUP BY last_name
ORDER BY c DESC
LIMIT 10;

-- ¿Cuales son los full_names más populares?

SELECT COUNT(first_name || last_name ) c, first_name || ' ' || last_name full_names
FROM actors
GROUP BY full_names
ORDER BY c DESC
LIMIT 10;