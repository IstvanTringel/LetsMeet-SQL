SELECT 
    YEAR(joined) AS 'YEARS', COUNT(member_id)
FROM
    grp_member
GROUP BY YEARS
ORDER BY YEARS;

SELECT 
    *
FROM
    grp_member;

SET SQL_SAFE_UPDATES=0;

UPDATE grp_member 
SET 
    city = REPLACE(city,
        'West New York',
        'New York');

UPDATE grp_member 
SET 
    city = REPLACE(city, 'East Chicago', 'Chicago');

UPDATE grp_member 
SET 
    city = REPLACE(city, 'West Chicago', 'Chicago');

UPDATE grp_member 
SET 
    city = REPLACE(city,
        'North Chicago',
        'Chicago');

UPDATE grp_member 
SET 
    city = REPLACE(city,
        'Chicago Heights',
        'Chicago');

UPDATE grp_member 
SET 
    city = REPLACE(city,
        'Chicago Ridge',
        'Chicago');

UPDATE grp_member 
SET 
    city = REPLACE(city,
        'South San Francisco',
        'San Francisco');

SELECT 
    *
FROM
    grp_member;

SET SQL_SAFE_UPDATES=1;

SELECT 
    YEAR(joined) AS 'YEARS', COUNT(member_id)
FROM
    grp_member
WHERE
    city = 'Chicago'
GROUP BY YEARS
ORDER BY YEARS;

SELECT 
    YEAR(joined) AS 'YEARS', COUNT(member_id)
FROM
    grp_member
WHERE
    city = 'New York'
GROUP BY YEARS
ORDER BY YEARS;

SELECT 
    YEAR(joined) AS 'YEARS', COUNT(member_id)
FROM
    grp_member
WHERE
    city = 'San Francisco'
GROUP BY YEARS
ORDER BY YEARS;

SELECT 
    MONTH(joined) AS 'MONTHS', COUNT(member_id)
FROM
    grp_member
WHERE
    YEAR(joined) = '2017'
GROUP BY MONTHS
ORDER BY MONTHS;

SELECT 
    MONTH(joined) AS 'MONTHS', COUNT(member_id)
FROM
    grp_member
WHERE
    YEAR(joined) = '2016'
GROUP BY MONTHS
ORDER BY MONTHS;

SELECT 
    *
FROM
    grp_member
WHERE
    YEAR(joined) = '2017'
ORDER BY joined DESC;