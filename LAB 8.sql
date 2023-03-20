# 1. List the number of films per category.

SELECT 
c.name,
count(*)
FROM sakila.film_category f
JOIN sakila.category c ON f.category_id = c.category_id
GROUP BY c.category_id;





# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT
s.first_name,
s.last_name,
a.address
FROM sakila.staff s
JOIN sakila.address a ON  s.address_id = a.address_id;



# 3. Display the total amount rung up by each staff member in August 2005.
SELECT
s.first_name,
s.last_name,
sum(amount) as totalamount
FROM sakila.staff s
JOIN sakila.payment p ON s.staff_id = p.staff_id
WHERE month(payment_date)=8 and year(payment_date)=2005
GROUP BY 1,2
ORDER BY totalamount desc;




# 4. List all films and the number of actors who are listed for each film.
SELECT 
f.title,
count(actor_id)
FROM sakila.film f
JOIN sakila.film_actor fa ON f.film_id = fa.film_id
GROUP BY 1
ORDER BY 2 desc;


# 5. Using the payment and the customer tables as well as the JOIN command, 
# list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT
c.last_name,
c.first_name,
sum(amount)
FROM sakila.customer c
JOIN sakila.payment p ON c.customer_id = p.customer_id
GROUP BY 1,2
ORDER BY last_name;