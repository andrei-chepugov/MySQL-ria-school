SELECT model_id,
       city_id,
       COUNT(*),
       AVG(price)
FROM auto.advertisements
GROUP BY model_id, city_id;

/*
Для получения названий моделей и городов, можно воспользоваться таким выражением:

SELECT 
    models.name AS model,
    cities.name AS city,
    COUNT(*) AS count,
    AVG(price) AS avg
FROM
    auto.advertisements
        INNER JOIN
    auto.models ON model_id = models.id
        INNER JOIN
    auto.cities ON city_id = cities.id
GROUP BY model_id , city_id;
*/
