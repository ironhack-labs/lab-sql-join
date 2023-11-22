-- 1. List the number of films per category.
select category.name, count(movies.film_id) as number_films
from sakila.category as category
left join sakila.film_category as movies
on category.category_id = movies.category_id
group by category.name
;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select staff.staff_id, staff.first_name, staff.last_name, address.address, address.district, address.postal_code, address.city_id
from sakila.staff as staff
left join sakila.address as address
on staff.address_id = address.address_id
;

-- 3. Display the total amount rung up by each staff member in August 2005. ('payment' and 'staff')
select staff.staff_id, staff.first_name, staff.last_name, sum(payment.amount) as sum_payments_collected
from sakila.staff as staff
left join sakila.payment as payment
on staff.staff_id = payment.staff_id
where month(payment.payment_date) = 08 and year(payment.payment_date) = 2005
group by staff.staff_id
;

-- 4. List all films and the number of actors who are listed for each film.
select film.film_id, film.title, count(actor.actor_id) as number_of_actors
from sakila.film as film
left join sakila.film_actor as actor
on film.film_id = actor.film_id
group by 1
;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
--    List the customers alphabetically by their last names.

select cust.customer_id, cust.first_name, cust.last_name, sum(pay.amount) as total_amount
from sakila.customer as cust
left join sakila.payment as pay
on cust.customer_id = pay.customer_id
group by cust.customer_id
order by last_name asc
;