-- List the number of films per category.
select film_category.category_id, count(film_category.film_id) as number_films, category.name
from sakila.film_category
join sakila.category on category.category_id = film_category.category_id
group by category_id
order by count(film_category.film_id) desc;

-- Display the first and the last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, address.address, address.district
from sakila.staff
join sakila.address on address.address_id = staff.address_id;

-- Display the total amount rung up by each staff member in August 2005.
select payment.staff_id, first_name, last_name, round(sum(amount), 2) as amount_month
from sakila.payment
inner join sakila.staff on staff.staff_id = payment.staff_id
where extract(year_month from payment_date) = 200508
group by payment.staff_id;

-- List all films and the number of actors who are listed for each film.
select film.title, count(actor_id) as number_actors
from sakila.film_actor
left join sakila.film on film.film_id = film_actor.film_id
group by title
order by count(actor_id) desc;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.
select customer.first_name, customer.last_name, sum(payment.amount) as total_paid
from sakila.customer
left join sakila.payment on payment.customer_id = customer.customer_id
group by customer.last_name, customer.first_name
order by last_name asc;
