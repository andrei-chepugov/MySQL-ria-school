SELECT *
FROM auto.advertisements
WHERE city_id = 2;

/*
Для получения названий колонок, можно воспользоваться таким выражением:

SELECT 
    advertisements.id,
    categories.name AS categories,
    marks.name AS marks,
    models.name AS models,
    cities.name AS city,
    currencies.name AS currency,
    price
FROM
    auto.advertisements
        INNER JOIN
    auto.categories ON category_id = categories.id
        INNER JOIN
    auto.marks ON marka_id = marks.id
        INNER JOIN
    auto.models ON model_id = models.id
        INNER JOIN
    auto.cities ON city_id = cities.id
        INNER JOIN
    auto.currencies ON currency_id = currencies.id
WHERE
    city_id = 2
*/
