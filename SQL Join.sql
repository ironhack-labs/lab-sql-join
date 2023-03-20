USE sakila;

# 1. List the number of films per category.
SELECT
	c.category_id,
    c.name,
    count(*) as num_films
FROM film_category fc
LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id;

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT
	f.first_name,
    f.last_name,
    a.address
FROM staff f
LEFT JOIN address a ON f.address_id = a.address_id;

# 3. Display the total amount rung up by each staff member in August 2005.
SELECT
	s.staff_id,
    s.first_name,
    s.last_name,
    sum(amount) as TotalAmount
FROM payment p
LEFT JOIN staff s ON s.staff_id = p.staff_id
WHERE date_format(p.payment_date,'%Y-%M') = '2005-August'
GROUP BY s.staff_id;

# 4. List all films and the number of actors who are listed for each film.
SELECT
	f.film_id,
    f.title,
    count(*) as Num_actors
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY 2 DESC;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
# List the customers alphabetically by their last names.
SELECT
	c.customer_id,
    c.first_name,
    c.last_name,
    sum(amount) as TotalAmount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;