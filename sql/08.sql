/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

select distinct(title)
from film
where rating = 'G' and film_id in (
    select a.film_id 
    from (select film_id, unnest(special_features) as "features" from film) as a    where a.features = 'Trailers'
)
order by title;
