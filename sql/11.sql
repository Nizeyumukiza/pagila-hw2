/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct(first_name || ' ' || last_name) as "Actor Name"
from film
join film_actor using(film_id)
join actor using(actor_id)
where film.film_id in (
    select a.film_id
    from (select film_id, unnest(special_features) as "features" from film) as a
    where a.features = 'Behind the Scenes'
)
order by "Actor Name";
