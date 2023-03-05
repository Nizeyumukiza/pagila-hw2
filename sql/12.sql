/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
select *
from (
select title
from film
where film_id in (
    select a.film_id
    from (select film_id, unnest(special_features) as "features" from film) as a
    where a.features = 'Behind the Scenes'
)
order by title) as "behind_table"

inner join

(select title
from film
where film_id in (
    select a.film_id
    from (select film_id, unnest(special_features) as "features" from film) as a
    where a.features = 'Trailers'
)
order by title) as "trailers_table"
using(title);
