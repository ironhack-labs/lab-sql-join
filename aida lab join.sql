-- 1 List the number of films per category.
-- 2 Display the first and the last names, as well as the address, of each staff member.
-- 3 Display the total amount rung up by each staff member in August 2005.
-- 4 List all films and the number of actors who are listed for each film.
-- 5 Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
    -- List the customers alphabetically by their last names.alter
    
use sakila;

SELECT c.name AS category_name, COUNT(f.film_id) AS number_of_films
FROM sakila.film AS f
JOIN sakila.film_category AS fc ON f.film_id = fc.film_id
JOIN sakila.category AS c ON fc.category_id = c.category_id
GROUP BY c.name;

SELECT 
    s.first_name AS First_Name,
    s.last_name AS Last_Name,
    a.address AS Address
FROM 
    sakila.staff AS s
JOIN 
    sakila.address AS a ON s.address_id = a.address_id;

SELECT stf.first_name, stf.last_name AS 'Staff Members', SUM(p.amount) AS 'Total Amount'
FROM sakila.staff AS stf
JOIN sakila.payment AS p ON stf.staff_id = p.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005
GROUP BY stf.staff_id;

SELECT f.title AS 'FILM TITLE', COUNT(fa.actor_id) AS 'NUMBER OF ACTORS'
FROM sakila.film AS f
JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
GROUP BY f.film_id;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount_paid
FROM sakila.customer AS c
JOIN sakila.payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name;
