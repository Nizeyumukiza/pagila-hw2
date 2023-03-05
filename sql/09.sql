/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
select distinct(a.features) as "special_features", count(a.film_id)
from (select film_id, unnest(special_features) as "features" from film) as a
group by a.features
order by a.features;
