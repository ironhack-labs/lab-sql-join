-- 1. List the number of films per category.
select 
category_id,
count(*) as num_per_cat
from sakila.film_category
group by category_id
;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select 
first_name,
last_name,
address
from sakila.staff a
join sakila.address l on a.address_id = l.address_id  
;

-- 3. Display the total amount rung up by each staff member in August 2005.
select 
staff_id, 
sum(amount) as TotalAmount
from sakila.payment
where payment_date like '%-08-2005'
group by staff_id
;

-- 4. List all films and the number of actors who are listed for each film.

select 
a.title,
count(l.actor_id) as num_actors
from sakila.film a 
left join sakila.film_actor l on a.film_id = l.film_id
group by a.title
;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.

select 
l.first_name, 
l.last_name, 
sum(a.amount) as TotalPaid
from sakila.payment a 
left join sakila.customer l on a.customer_id = l.customer_id
group by a.customer_id
order by l.last_name
;

