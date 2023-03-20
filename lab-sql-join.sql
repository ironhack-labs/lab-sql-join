-- 1. List the number of films per category.
SELECT f.category_id, name, count(name) as counting
FROM sakila.category c
JOIN sakila.film_category f
ON f.category_id = c.category_id
GROUP BY name;

-- 2.Display the first and the last names, as well as the address, of each staff member.
SELECT first_name,  last_name, address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;


-- 3.Display the total amount rung up by each staff member in August 2005.
SELECT *
FROM sakila.payment;


SELECT staff_id, sum(amount)
FROM sakila.payment
WHERE payment_date regexp '^2005-08'
GROUP BY staff_id;


-- 4.List all films and the number of actors who are listed for each film.
SELECT f.title, count(first_name) as numbOfActors
FROM sakila.film_actor fa
JOIN sakila.actor a ON fa.actor_id = a.actor_id
JOIN sakila.film f ON f.film_id = fa.film_id
GROUP BY 1;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
#List the customers alphabetically by their last names.
SELECT c.first_name, c.last_name, sum(p.amount) as TotalAmountPaid
FROM sakila.customer c
JOIN sakila.payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name
ORDER BY c.last_name ASC



