-- List the number of films per category.
-- first let 's see tab category 

select *
from sakila.category;

select *
from sakila.film_category;

-- Use join function to get the count of film by category

SELECT c.category_id, c.name , count(f.film_id) as film_count
FROM sakila.category c
LEFT JOIN sakila.film_category f  ON c.category_id = f.category_id
GROUP BY c.category_id, c.name ;

-- Display the first and the last names, as well as the address, of each staff member. 

select *
from sakila.address;

select *
from sakila.staff;

select *
from sakila.payment;

-- using join for address 
-- Display the first and the last names, as well as the address, of each staff member.

SELECT 
    s.first_name,
    s.last_name,
    a.address
    
FROM
    sakila.staff s
JOIN
    sakila.address a ON s.address_id = a.address_id ;

-- Display the total amount rung up by each staff member in August 2005.

select *
from sakila.staff;

select *
from sakila.payment;


-- Using join statement to find the payment amount and where to get only the month of August, by converting the date
-- result
-- Mike	Hillyer	1	11853.65
-- Jon	Stephens	2	12216.49

SELECT
    s.first_name,
    s.last_name,
    s.staff_id,
    sum(p.amount) as amount
FROM
    sakila.payment p
JOIN
sakila.staff s	 ON s.staff_id = p.staff_id 
where date_format(convert(p.payment_date,date),'%M' ) = 'August'
group by s.staff_id
;

-- List all films and the number of actors who are listed for each film.
-- checmikng table first 

select *
from sakila.film;

select *
from sakila.actor;

select *
from sakila.film_actor;


-- Using join statement to find the nb of film by actor
-- result title , film id, nb actor
-- ACADEMY DINOSAUR	1	10
-- ACE GOLDFINGER	2	4
-- ADAPTATION HOLES	3	5
-- AFFAIR PREJUDICE	4	5
-- AFRICAN EGG	5	5

SELECT
    f.title,
    f.film_id,
    count(actor_id) as nb_actor
FROM
    sakila.film f
left JOIN
sakila.film_actor a	 ON f.film_id = a.film_id 
group by f.film_id
;

-- Using the payment and the customer tables as well as the JOIN command,
-- list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.

select *
from sakila.payment;

select *
from sakila.customer;

-- result 
-- RAFAEL	ABNEY	505	97.79
-- NATHANIEL	ADAM	504	133.72
-- KATHLEEN	ADAMS	36	92.73
-- DIANA	ALEXANDER	96	105.73
-- GORDON	ALLARD	470	160.68
-- SHIRLEY	ALLEN	27	126.69


SELECT
    c.first_name,
    c.last_name,
    c.customer_id,
    round(sum(p.amount),0) as amount
FROM
    sakila.payment p
LEFT JOIN
sakila.customer c	 ON c.customer_id = p.customer_id 
group by c.customer_id
order by last_name asc
;
