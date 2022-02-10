SELECT * 
FROM
  (SELECT distinct Date(rental.rental_ts) as date, round(avg(film.rental_rate) OVER (
    ORDER BY date
    RANGE BETWEEN
            '6 DAYS' PRECEDING AND
            CURRENT ROW
    	),2) as moving_avg_rental_rate
  FROM rental 
  JOIN inventory on inventory.inventory_id = rental.inventory_id
  JOIN dates on dates.date = DATE(rental.rental_ts)
  JOIN film on film.film_id = inventory.film_id
  WHERE rental.rental_ts >= DATE'2020-07-20' AND rental.rental_ts  <= DATE'2020-08-31'
  ORDER BY date) as a
WHERE a.date >= DATE'2020-08-01' AND a.date  <= DATE'2020-08-31'
