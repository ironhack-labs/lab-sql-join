-- 1.List the number of films per category.
select cat.name, count(film_id) as num_films
from sakila.category cat
left join film_category fcat
on cat.category_id = fcat.category_id
group by 1
order by 2;

-- 2.Display the first and the last names, as well as the address, of each staff member.
select  st.staff_id, concat(first_name, ' ', last_name) as staff_full_name, a.address staff_address
from sakila.staff st
left join sakila.address a
on st.address_id = a.address_id;

-- 3.Display the total amount rung up by each staff member in August 2005.
select st.staff_id, concat(first_name, ' ', last_name) as staff_full_name, sum(amount) as total_amount_by_staff
from sakila.staff st
left join sakila.payment pay
on st.staff_id = pay.staff_id 
where (date_format(payment_date,"%Y")=2005) and (date_format(payment_date,'%M')='August')
group by st.staff_id
order by sum(amount);

-- 4.List all films and the number of actors who are listed for each film.
select f.title, count(actor_id) as number_of_actors_per_film
from sakila.film f
left join sakila.film_actor fact
on f.film_id = fact.film_id
group by f.film_id
order by 1;

-- 5.Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select concat(last_name, ', ',first_name) as customer_name, count(amount) as amount_paid_by_customer
from sakila.customer c
left join sakila.payment pay
on c.customer_id=pay.customer_id
group by c.customer_id
order by 1;
