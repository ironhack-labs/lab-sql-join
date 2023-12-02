select name, count(distinct film_id) as nr_films
from sakila.film_category a1 inner join sakila.category a2 on a1.category_id = a2.category_id
group by name;

select first_name, last_name, address 
from sakila.staff sta left join sakila.address ad on sta.address_id = ad.address_id;

select concat(first_name, " ", last_name) as staff_name, sum(amount) as total_amount_aug2005 
from sakila.staff sta inner join sakila.payment pay on sta.staff_id = pay.staff_id
where (month(payment_date)=8 and year(payment_date)=2005)
group by sta.staff_id;

select title, count(actor_id) as nr_actors_listed
from sakila.film f1 inner join sakila.film_actor f2 on f1.film_id = f2.film_id
group by title;

select first_name, last_name, sum(amount) as total_amount
from sakila.customer cust inner join sakila.payment pay on cust.customer_id = pay.customer_id
group by cust.customer_id order by last_name asc;