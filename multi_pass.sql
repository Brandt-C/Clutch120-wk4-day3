SELECT * from film_actor

SELECT *
from actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id

SELECT *
from film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id

select title, film_id -- err!
from film_actor
INNER JOIN film
on film.film_id = film_actor.film_id

select title, film.film_id
from film_actor
INNER JOIN film
on film.film_id = film_actor.film_id;



SELECT first_name, last_name, title
from film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
on film.film_id = film_actor.film_id;



SELECT title, first_name, last_name
from film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
on film.film_id = film_actor.film_id
where last_name LIKE 'Sw%'
-- ORDER BY title DESC



--  Sub queries!

-- query w/i a query
-- either query is it's own individual query.
-- 1 x 1 example, build both queries and put them together

-- find our big ballers that we created that have the biggest neg amounts!

select * from payment

select customer_id, SUM(amount)
from payment
GROUP BY customer_id
HAVING SUM(amount) < -15000
ORDER BY SUM(amount);

-- 2nd query

select * from customer;

select first_name, last_name, email
from customer

-- the sub query occurs WHERE, FROM, and  (technically) SELECT

-- Where clause example
select first_name, last_name, email, customer.customer_id
from customer
WHERE customer_id IN (
    select customer_id
    from payment
    GROUP BY customer_id
    HAVING SUM(amount) < -15000
    ORDER BY SUM(amount)
)


-- From clause

select first_name, last_name
from (
    SELECT title, first_name, last_name
    from film_actor
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    on film.film_id = film_actor.film_id
) AS multi
where title LIKE 'Chea%';


-- Select clause
-- not very useful, probably never gonna see this
select first_name, last_name, (
    select COUNT(*)
    from rental
)
from customer;

