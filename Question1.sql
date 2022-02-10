SELECT count(film_actor.film_id) as total_films, actor.first_name as first, actor.last_name as last
FROM film_actor 
JOIN actor ON actor.actor_id=film_actor.actor_id
GROUP BY first, last
ORDER BY total_films DESC
LIMIT 100;
