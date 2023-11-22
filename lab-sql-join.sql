-- 1. List the number of films per `category`.
SELECT
    name,
    COUNT(name) AS count_category
FROM
    sakila.film_category film
LEFT JOIN
    sakila.category cat
ON
    film.category_id = cat.category_id
GROUP BY
    name;
    
-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT
    first_name,
    last_name,
    address
FROM
    sakila.address ad
INNER JOIN
    sakila.staff st
ON
    ad.address_id = st.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
SELECT
    staff_id,
    SUM(amount) AS total_amount
FROM 
    sakila.payment
WHERE 
    DATE_FORMAT(payment_date, '%Y-%m') = '2005-08'
GROUP BY 
    staff_id;

-- 4. List all films and the number of actors who are listed for each film.
SELECT
    film.title,
    COUNT(film_actor.actor_id) AS n_actor 
FROM 
    film_actor
LEFT JOIN 
    film
ON
    film_actor.film_id = film.film_id
GROUP BY 
    film.film_id, film.title
ORDER BY 
    n_actor DESC;

-- 5. Using the `payment` and the `customer` tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT
    CONCAT(cust.first_name, ' ', cust.last_name) AS name_sorted,
    COUNT(pay.amount) AS total_amount
FROM 
    sakila.customer cust
LEFT JOIN
    sakila.payment pay
ON
    cust.customer_id = pay.customer_id
GROUP BY 
    cust.customer_id, cust.first_name, cust.last_name
ORDER BY 
    cust.last_name ASC;
