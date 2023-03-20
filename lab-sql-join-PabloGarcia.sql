-- 1. List the number of films per category.
SELECT category_id, count(film_id) as FilmsPerCategory FROM sakila.film_category GROUP BY category_id;

-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT first_name, last_name, email FROM sakila.staff;

-- 3. Display the total amount rung up by each staff member in August 2005.
SELECT L.first_name, L.last_name, sum(amount) as TotalAmount FROM sakila.staff L JOIN sakila.payment R ON L.staff_id = R.staff_id GROUP BY 1,2;

-- 4. List all films and the number of actors who are listed for each film.
SELECT L.title, count(R.actor_id) as NumberOfActors FROM sakila.film L JOIN sakila.film_actor R ON L.film_id = R.film_id GROUP BY L.title;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.
SELECT L.last_name, L.first_name, sum(amount) FROM sakila.customer L JOIN sakila.payment R ON L.customer_id = R.customer_id GROUP BY 1,2 order by L.last_name;

