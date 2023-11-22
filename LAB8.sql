-- 1. List the number of films per `category`.
select cat.name, count(film.film_id) as count_film_cat
from sakila.film film
left join sakila.film_category fc 
on film.film_id = fc.film_id
left join sakila.category cat
on fc.category_id = cat.category_id
group by cat.category_id
order by 2 desc;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, addr.address, addr.city_id, addr.postal_code
from sakila.staff staff
left join sakila.address addr
on staff.address_id=addr.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
create temporary table sakila.aug_payment 
select pay.staff_id, sum(amount) as total_sum
from sakila.payment pay
left join sakila.staff st
on pay.staff_id=st.staff_id
where month(payment_date)=8 and year(payment_date)=2005
group by 1
order by staff_id;


-- 4. List all films and the number of actors who are listed for each film.
select f.title, count(a.actor_id) as number_of_actor 
from sakila.film_actor fa
left join sakila.actor a
on fa.actor_id = a.actor_id
left join sakila.film f
on fa.film_id = f.film_id
group by 1
order by 2 desc;

-- 5. Using the `payment` and the `customer` tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.
select p.customer_id, c.first_name,c.last_name, sum(p.amount) as sum_amount
from sakila.payment p
left join sakila.customer c
on p.customer_id = c.customer_id
group by 1
order by c.last_name;