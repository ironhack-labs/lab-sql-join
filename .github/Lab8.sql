use sakila;
-- List the number of films per category.
select category.name, count(film_category.film_id) as number_films
from sakila.category
join sakila.film_category on category.category_id = film_category.category_id
GROUP BY category.name;

-- Display the first and the last names, as well as the address, of each staff member.
SELECT staff.first_name, staff.last_name, address.address
FROM sakila.staff
JOIN sakila.address ON staff.address_id = address.address_id;

-- Display the total amount rung up by each staff member in August 2005.
SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS total_amount
FROM sakila.staff
JOIN sakila.payment ON staff.staff_id = payment.staff_id
JOIN sakila.rental ON payment.rental_id = rental.rental_id
WHERE MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id;

-- List all films and the number of actors who are listed for each film.
SELECT film.title, COUNT(*) AS actors_per_film
FROM sakila.film
JOIN sakila.film_actor ON film.film_id = film_actor.film_id
JOIN sakila.actor ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically
-- by their last names.
select c.customer_id, c.last_name,
sum(p.amount) as TotalAmount
from customer c
join payment p
on c.customer_id = p.customer_id
group by customer_id
order by last_name desc;