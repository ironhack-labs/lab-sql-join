use sakila;

-- 1

with film_cat as(
	select film_id, category_id from film_category
),
cat as (
	select name, film_cat.* from category
		join film_cat on category.category_id = film_cat.category_id
)
select title, cat.name, rank() over (partition by cat.name order by film.film_id desc) as 'rank' from film
	join cat on film.film_id = cat.film_id;
    
-- 2

select first_name, last_name, address.address from staff
	join address on staff.address_id = address.address_id;
    
-- 3

select sum(amount), payment.staff_id, staff.first_name, staff.last_name from payment
	join staff on payment.staff_id = staff.staff_id
where month(payment_date) = 8 and year(payment_date) = 2005
group by staff_id;

-- 4

select title, count(film_actor.actor_id) as cast_size from film
	join film_actor where film.film_id = film_actor.film_id
    group by title;
    
-- 5

select last_name, sum(payment.amount) from customer
	join payment on customer.customer_id = payment.customer_id
    group by last_name
    order by 1, 2;