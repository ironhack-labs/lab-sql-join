SELECT
     c.name,
     count(*)
FROM sakila.film_category fc
LEFT JOIN sakila.category c ON fc.category_id = c.category_id
GROUP BY c.category_id;

SELECT
      s.first_name,
      s.last_name,
      a.address
FROM sakila.staff s
LEFT JOIN sakila.address a ON s.address_id = a.address_id;

SELECT
      s.first_name,
      s.last_name,
      sum(p.amount) as TotalAmount
FROM sakila.payment p
JOIN sakila.staff s ON p.staff_id = s.staff_id
WHERE date_format(p.payment_date,'%Y-%M') = '2005-August'
GROUP BY s.staff_id
ORDER BY TotalAmount DESC;

SELECT
     fa.film_id,
     count(*)
FROM sakila.film f
LEFT JOIN sakila.film_actor fa ON f.film_id = fa.film_id
GROUP BY fa.film_id;

SELECT
      c.first_name,
      c.last_name,
	  p.customer_id,
      sum(amount) as TotalAmount
FROM sakila.payment p
LEFT JOIN sakila.customer c ON c.customer_id = p.customer_id
GROUP BY 1,2,3
ORDER BY c.last_name;