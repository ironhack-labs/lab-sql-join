-- Instructions

-- List the number of films per category.

SELECT
	c.name,
	count(*)
FROM sakila.film_category fc
join sakila.category c
on fc.category_id = c.category_id
group by c.category_id;

-- Display the first and the last names, as well as the address, of each staff member.

Select
	f.first_name,
    f.Last_name,
    a.address
From sakila.address a
join sakila.staff f
on a.address_id = f.address_id;

-- Display the total amount rung up by each staff member in August 2005.

Select
	f.first_name,
    f.Last_name,
    sum(amount) as TotalAmount
From sakila.payment p
join sakila.staff s
on p.staff_id = s.staff_id
where month(payment_date)=8 and year(payment_date)=2005
group by 1,2;

-- List all films and the number of actors who are listed for each film.

Select
	f.title,
    count(actor_id)
From sakila.film f
join sakila.film_actor fa
on f.film_id = fa.film_id
group by 1;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.

Select
	c.Last_name,
	c.first_name,
    sum(amount)
From sakila.payment p
join sakila.customer c
on p.customer_id = c.customer_id
group by 1,2
order by last_name

