use sakila;

-- 1.List the number of films per category.
SELECT 
    category.name, 
COUNT(film_category.film_id) AS num_films
FROM sakila.category
JOIN sakila.film_category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- 2.Display the first and the last names, as well as the address, of each staff member.
select s.first_name,s.last_name,a.address
from staff s
left join address a
on s.address_id = a.address_id
;

-- 3.Display the total amount rung up by each staff member in August 2005.
select s.staff_id,s.first_name,s.last_name,
sum(p.amount) as TotalAmount
from staff s 
join payment p
on s.staff_id = p.staff_id
WHERE date_format(p.payment_date,'%Y-%M') = '2005-August'
group by staff_id
;

-- 4. List all films and the number of actors who are listed for each film.
select f.film_id, f.title, count(a.actor_id) as nr_actors 
from film f
join film_actor a 
on f.film_id = a.film_id 
group by title, film_id 
order by nr_actors desc
;


-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.customer_id,c.last_name,
sum(p.amount) as TotalAmount
from customer c
join payment p
on c.customer_id = p.customer_id
group by customer_id
order by last_name desc
;