SELECT city_id,
       COUNT(*)
FROM auto.advertisements
GROUP BY city_id;

/*
Для получения названий городов, можно воспользоваться таким выражением:

SELECT 
    cities.name, COUNT(*) AS count
FROM
    auto.advertisements
        INNER JOIN
    auto.cities ON city_id = cities.id
GROUP BY city_id;
*/
