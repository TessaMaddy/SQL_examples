SELECT count(distinct r.customer_id)
FROM
	( SELECT rental.customer_id, count(rental_id)
	FROM rental
	JOIN inventory on inventory.inventory_id = rental.inventory_id
	JOIN film on film.film_id = inventory.film_id
	JOIN customer on rental.customer_id = customer.customer_id
	JOIN address on address.address_id = customer.address_id
	JOIN city on city.city_id = address.city_id
	WHERE film.rating = 'PG' 
	AND  city.city != 'Dallas'
	AND customer.active = 1
	AND ( (rental_ts >= DATE'2020-08-15' AND rental_ts  < DATE'2020-09-01') 
	OR (rental_ts >= DATE'2020-07-15' AND rental_ts  < DATE'2020-08-01') ) 
	GROUP BY rental.customer_id
	HAVING count(rental_id) > 1 ) as r
