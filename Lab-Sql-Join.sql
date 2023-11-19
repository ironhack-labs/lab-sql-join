-- 1) Listing the number of films per category
select categ.name, count(*) as number_of_films
from sakila.category categ
left join sakila.film_category film_categ
on categ.category_id = film_categ.category_id
group by name;

-- 2) Displaying the first and the last names, as well as the address, of each staff member
select first_name, last_name, address
from sakila.staff _staff_
left join sakila.address _address_
on _staff_.address_id = _address_.address_id;

-- 3) Displaying the total amount rung up by each staff member in August 2005
select _payment_.staff_id, first_name, last_name, sum(amount) as total_amount
from sakila.payment _payment_
inner join sakila.staff _staff_
on _payment_.staff_id = _staff_.staff_id
where (date_format(payment_date, "%Y") = 2005) and (date_format(payment_date, "%M") = "August")
group by staff_id;

-- 4) Listing all films and the number of actors who are listed for each film
select _film_.title, count(*) as number_of_actors
from sakila.film_actor _film_actor_
left join sakila.film _film_
on _film_actor_.film_id = _film_.film_id
group by _film_actor_.film_id;

-- 5) Listing the total amount paid by each customer
select _customer_.customer_id, first_name, last_name, sum(amount) as total_amount
from sakila.payment _payment_
left join sakila.customer _customer_
on _payment_.customer_id = _customer_.customer_id
group by _payment_.customer_id
order by last_name asc;