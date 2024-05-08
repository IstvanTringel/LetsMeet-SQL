SELECT 
    *
FROM
    grp;

SELECT 
    SUM(CASE
        WHEN rating = 0 THEN 1
        ELSE 0
    END) '0',
    SUM(CASE
        WHEN rating < 1 THEN 1
        ELSE 0
    END) '0-1',
    SUM(CASE
        WHEN rating BETWEEN 1 AND 1.99 THEN 1
        ELSE 0
    END) '1-1.99',
    SUM(CASE
        WHEN rating BETWEEN 2 AND 2.99 THEN 1
        ELSE 0
    END) '2-2.99',
    SUM(CASE
        WHEN rating BETWEEN 3 AND 3.99 THEN 1
        ELSE 0
    END) '3-3.99',
    SUM(CASE
        WHEN rating BETWEEN 4 AND 4.99 THEN 1
        ELSE 0
    END) '4-4.99',
    SUM(CASE
        WHEN rating = 5 THEN 1
        ELSE 0
    END) '5'
FROM
    grp;

SELECT 
    city, rating, members, group_name, category_id
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    rating = 5 AND city = 'New York'
ORDER BY members ASC;

SELECT 
    city, rating, members, group_name, category_id
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    rating = 5 AND city = 'Chicago'
ORDER BY members DESC;

SELECT 
    city, rating, members, group_name, category_id
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    rating = 5 AND city = 'San Francisco'
ORDER BY members DESC;