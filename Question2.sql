SELECT category.name, count(film_category.category_id) as total_films
FROM category
JOIN film_category ON category.category_id=film_category.category_id
WHERE category.name NOT IN ('Sports', 'Games')
GROUP BY category.name
ORDER BY total_films DESC;
