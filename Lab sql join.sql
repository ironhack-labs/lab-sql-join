select	c.name, count(fc.film_id) as 'Num_films'
from sakila.category c
join sakila.film_category fc on c.category_id = fc.category_id
group by c.name;

select s.first_name, s.last_name, s.address_id, a.address
from sakila.staff s
join sakila.address a on s.address_id = a.address_id;

select s.first_name, s.last_name, sum(amount) as 'TotalAmount' 
from sakila.payment p
join sakila.staff s on p.staff_id = s.staff_id 
where p.payment_date between '2005-08-01' and '2005-08-31' 
group by s.staff_id;

select f.film_id, f.title, count(a.actor_id) as 'Nr_Actors' 
from sakila.film f
join sakila.film_actor a on f.film_id = a.film_id
group by title, film_id
order by nr_actors desc;

select c.first_name, c.last_name, sum(p.amount) as 'TotalAmount'
from sakila.customer c
join sakila.payment p on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name asc;