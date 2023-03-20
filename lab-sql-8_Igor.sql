-- Lab | SQL Join

-- List the number of films per category.

SELECT 
	c.name, 
COUNT(fc.film_id) AS num_films
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- Display the first and the last names, as well as the address, of each staff member.

SELECT 
	s.first_name, 
	s.last_name, 
	s.address_id,
    a.address
FROM sakila.staff s
JOIN sakila.address a ON s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August 2005.

SELECT 
    s.first_name, 
    s.last_name, 
SUM(amount) AS total_amount 
FROM sakila.payment p
JOIN sakila.staff s ON p.staff_id = s.staff_id 
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31' 
GROUP BY s.staff_id;

-- List all films and the number of actors who are listed for each film.

SELECT 
	f.film_id,
    f.title, 
COUNT(a.actor_id) AS nr_actors 
FROM sakila.film f
JOIN sakila.film_actor a ON f.film_id = a.film_id
GROUP BY title, film_id
ORDER BY nr_actors DESC;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
-- List the customers alphabetically by their last names.

SELECT
	c.first_name, 
	c.last_name, 
SUM(p.amount) AS Total_Amount
FROM sakila.customer c
JOIN sakila.payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;