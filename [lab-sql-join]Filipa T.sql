-- 1. List the number of films per category.

select c.category_id, c.name, count(distinct fc.film_id) film_count
from sakila.category c 
left join sakila.film_category fc
on c.category_id = fc.category_id
group by c.category_id, c.name;
;


-- 2. Display the first and the last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from sakila.staff s
left join sakila.address a
on s.address_id = a.address_id
;

-- 3. Display the total amount rung up by each staff member in August 2005.

select s.staff_id, sum(p.amount) as total_amount
from sakila.staff s
left join sakila.rental r
on s.staff_id = r.staff_id
left join sakila.payment p
on r.rental_id = p.rental_id
where (date_format(rental_date, '%M') = 'August') and (date_format(rental_date, '%Y') = '2005') 
group by s.staff_id
;

-- 4. List all films and the number of actors who are listed for each film.

select f.film_id, count(fa.actor_id) as actors
from sakila.film f
left join sakila.film_actor fa
on f.film_id = fa.film_id
group by f.film_id
;

-- 5. Using the payment and the customer tables as well as the JOIN command, 
-- list the total amount paid by each customer. List the customers alphabetically by their last names.

select c.first_name, c.last_name, sum(p.amount) as total_amount
from sakila.payment p
join sakila.customer c
on p.customer_id = c.customer_id
group by c.customer_id
order by c.first_name asc, c.last_name asc
;
