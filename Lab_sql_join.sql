use sakila;

# 1 - List the number of films per category.
select l.name, count(*) as films 
from sakila.category l
left join film_category d on l.category_id = d.category_id
group by l.category_id;

# 2 - Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from sakila.staff s
left join address a on s.address_id = a.address_id;

# 3 - Display the total amount rung up by each staff member in August 2005.
select s.first_name, s.last_name, sum(amount) as TotalAmount
from sakila.staff s
left join payment p on s.staff_id = p.staff_id
where date_format(convert(p.payment_date,date),'%Y-%M') = '2005-August'
group by s.staff_id;

# 4 List all films and the number of actors who are listed for each film.
select f.title, count(*)
from sakila.film f
left join film_actor a on f.film_id = a.film_id
group by f.film_id;

# 5 Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
#List the customers alphabetically by their last names.
select c.first_name,c.last_name, p.customer_id,sum(p.amount) as TotalAmount
from sakila.customer c
left join payment p on c.customer_id = p.customer_id
group by 1,2,3
order by last_name asc;









select c.customer_id, c.last_name,
sum(p.amount) as TotalAmount
from customer c
join payment p
on c.customer_id = p.customer_id
group by customer_id
order by last_name desc
;
