-- 1. List the number of films per category.
select f.title, c.name
from sakila.film as f
left join sakila.film_category as fc
on  fc.film_id = f.film_id
left join sakila.category as c
on  c.category_id = fc.category_id
order by c.name
;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select concat(s.first_name, ' ', s.last_name) as name, a.address as address1
from sakila.staff as s
left join sakila.address as a
on  s.address_id = a.address_id
order by name
;

-- 3. Display the total amount rung up by each staff member in August 2005.
select concat(s.first_name, ' ', s.last_name) as name, sum(p.amount) as revenue
from sakila.staff as s
left join sakila.payment as p
on  s.staff_id = p.staff_id
where month(p.payment_date)= 8 and year(p.payment_date)= '2005'
group by name
;
-- 4. List all films and the number of actors who are listed for each film.
select f.title, count(actor_id) as qty_of_actors
from sakila.film as f
left join sakila.film_actor as fa
on  f.film_id = fa.film_id
group by f.title
;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.first_name, c.last_name , sum(p.amount) as total_spent
from  sakila.customer as c
left join sakila.payment as p
on  c.customer_id = p.customer_id
group by c.customer_id
order by 2
;





