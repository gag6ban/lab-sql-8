-- Lab | SQL Join (Part II)

USE sakila;
-- Q1 Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, c.city, ct.country 
FROM store s
JOIN address USING (address_id)
JOIN city c using (city_id)
JOIN country ct using (country_id);

-- Q2 Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM sakila.customer;
SELECT * FROM sakila.payment;
SELECT store_id AS 'Store', SUM(amount) AS 'Turnover'
FROM sakila.customer c
JOIN sakila.payment p USING (customer_id)
GROUP BY store_id;

-- Q3 Which film categories are longest?


-- Q4 Display the most frequently rented movies in descending order.
SELECT title
FROM rental
JOIN inventory using (inventory_id) 
JOIN film using (film_id)
GROUP BY title
ORDER BY count(rental_id) DESC;

-- Q5 List the top five genres in gross revenue in descending order.

SELECT c.name as genre, sum(p.amount) as 'gross revenue'
from category c
join film_category f using (category_id)
join inventory i using (film_id)
join rental r using(inventory_id)
join payment p using (rental_id)
group by f.category_id
order by sum(p.amount) DESC
LIMIT 5;

-- Q6 Is "Academy Dinosaur" available for rent from Store 1?
select
case
when count(i.film_id)>0 then 'Available'
else 'Unavailabe'
end as 'Store availability', count(i.film_id) as 'Quantity'
from film f
join inventory i using(film_id)
join store s using (store_id)
where f.title = "Academy Dinosaur" and s.store_id=1
group by i.film_id;

-- Q7 Get all pairs of actors that worked together.
SELECT a1.actor_id as 'Actor 1' , a2.actor_id as 'Actor 2'
FROM film_actor a1
JOIN film_actor a2
ON (a1.film_id = a2.film_id) AND (a1.actor_id <> a2.actor_id);


-- Q8 Get all pairs of customers that have rented the same film more than 3 times.




-- Q9 For each film, list actor that has acted in more films.

