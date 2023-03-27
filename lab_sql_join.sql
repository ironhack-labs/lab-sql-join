-- 1. List the number of films per category

select category_id, count(film_id) as num_films
from sakila.film_category
group by category_id;

-- or

select c.name, count(*)
from sakila.film_category fc
join sakila.category c
on fc.category_id = c.category_id
group by c.category_id;

-- 2. Display the first and the last names, as well as the address, of each staff member.

select f.first_name, f.last_name, a.address_id
from sakila.address a
join sakila.staff f
on a.address_id = f.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.

select f.first_name, f.Last_name,
sum(amount) as TotalAmount
from sakila.payment p
join sakila.staff s
on p.staff_id = s.staff_id
where month(payment_date)=8 and year(payment_date)=2005
group by 1,2;

-- 4. List all films and the number of actors who are listed for each film.

select f.title, count(actor_id)
from sakila.film f
join sakila.film_actor fa
on f.film_id = fa.film_id
group by 1;


-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
-- List the customers alphabetically by their last names.

select c.Last_name, c.first_name,
sum(amount)
from sakila.payment p
join sakila.customer c
on p.customer_id = c.customer_id
group by 1,2
order by last_name





