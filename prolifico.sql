-- Listá el top 100 de actores más activos y el número de roles en los que participó.

SELECT actors.first_name||' ' || actors.last_name actor, COUNT(*) c
FROM roles
INNER JOIN actors
ON actors.id = roles.actor_id
GROUP BY roles.actor_id
ORDER BY c DESC
LIMIT 100;