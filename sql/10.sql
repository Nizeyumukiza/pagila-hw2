/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

select features as "special_feature", sum(payment.amount) as "profit" 
from (select film_id, unnest(special_features) as "features" from film) as a
join film using(film_id) 
join  inventory on film.film_id = inventory.film_id 
join rental on rental.inventory_id = inventory.inventory_id 
join payment on rental.rental_id = payment.rental_id 
group by features
order by features;
