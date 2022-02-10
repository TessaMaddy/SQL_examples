  /*
  
  It seems that sales are less consistent around the beginning half of the month since there are less date observations. I would suggest running sales or promotions 
  during this time and then see if that entices clients and boosts rental rates.
  
  */
  
  SELECT Date(rental.rental_ts) as date, round(avg(film.rental_rate),2) as avg_rental_rate
  FROM rental 
  JOIN inventory on inventory.inventory_id = rental.inventory_id
  JOIN dates on dates.date = DATE(rental.rental_ts)
  JOIN film on film.film_id = inventory.film_id
  GROUP BY Date(rental.rental_ts)
  ORDER BY date
 
