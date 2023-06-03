USE sakila;

SELECT title, length, 
RANK() OVER (ORDER BY length DESC) as 'Rank'
FROM sakila.film
WHERE length IS NOT NULL;

SELECT title, length, rating, 
RANK() OVER (PARTITION BY rating ORDER BY length DESC) as 'Rank'
FROM sakila.film
WHERE length IS NOT NULL;

SELECT name, COUNT(film_id) 
FROM sakila.film_category fc
LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY name;

SELECT first_name, last_name, COUNT(film_id) 
FROM sakila.film_actor fa
LEFT JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;

SELECT first_name, last_name, COUNT(rental_id) 
FROM sakila.customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY COUNT(rental_id) DESC
LIMIT 1;

-- BONUS
SELECT title, COUNT(rental_id) 
FROM sakila.film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY title
ORDER BY COUNT(rental_id) DESC
LIMIT 1;