SELECT EXTRACT(WEEK from rental.rental_ts) as week, 
	EXTRACT(month from rental.rental_ts) as month, 
	COUNT(distinct payment.customer_id) as number_of_customers,
	SUM(payment.amount) as total_revenue,
	COUNT(inventory.inventory_id) as total_rentals
FROM rental
JOIN payment on rental.rental_id = payment.rental_id
JOIN inventory on rental.inventory_id = inventory.inventory_id
WHERE inventory.store_id = 1
GROUP BY week, month
ORDER BY week desc
LIMIT 12;

/* (no rentals in week 24) */
