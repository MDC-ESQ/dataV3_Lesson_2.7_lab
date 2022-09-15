USE sakila;

-- Lab | SQL Join (Part I)

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.category;

SELECT c.category_id, c.name, COUNT(f_c.film_id) AS 'Nr. Films'
FROM sakila.category c
INNER JOIN sakila.film_category f_c
ON c.category_id = f_c.category_id
GROUP BY c.category_id, c.name
ORDER BY COUNT(f_c.film_id) DESC;


-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;

SELECT s.first_name, s.last_name, ROUND(SUM(p.amount),0) AS 'Amount'
FROM sakila.staff s
INNER JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY s.first_name, s.last_name
ORDER BY SUM(p.amount) DESC;


-- 3. Which actor has appeared in the most films?
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;

SELECT a.first_name, a.last_name, COUNT(f_a.film_id) AS 'Count'
FROM sakila.film_actor f_a
INNER JOIN sakila.actor a
ON f_a.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(f_a.film_id) DESC;


-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS 'Count'
FROM sakila.customer c
INNER JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY COUNT(r.rental_id) DESC;


-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
INNER JOIN sakila.address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.film;

SELECT f.film_id, f.title, COUNT(f_a.actor_id) AS 'Nr. actors'
FROM sakila.film_actor f_a
INNER JOIN sakila.film f
ON f_a.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY COUNT(actor_id) DESC;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM sakila.payment;
SELECT * FROM sakila.customer;

SELECT c.last_name, c.first_name, c.customer_id, SUM(p.amount) AS 'Amount paid'
FROM sakila.payment p
INNER JOIN sakila.customer c
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name ASC;


-- 8. List number of films per category.
SELECT * FROM sakila.film_category;

SELECT category_id, COUNT(film_id) as 'Nr. Films'
FROM sakila.film_category
GROUP BY category_id
ORDER BY COUNT(film_id) DESC;

-- same as question 1. diffferent way of getting data