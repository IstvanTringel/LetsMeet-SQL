-- Venues
/* New York has the most Venues with 526, followed by Chicago with 288 and San Francisco with 204  */
SELECT 
    City, COUNT(*)
FROM
    venue_
GROUP BY city
ORDER BY COUNT(*);

-- GRP
/* The longest running club is the New York City Poker Group which was created in October 8th 2002, the group has 1797 members.*/
SELECT DISTINCT
    (group_id), group_name, members, created
FROM
    grp
ORDER BY created;

-- GRP_MEMBER
/*The first still active member is Christine from New York, who joined LetsMeet on the 14th of April 2003.alter
Michael is part of the most, 350 groups followed by David with 303 and John with 231*/
SELECT 
    Joined, member_name, member_status, city
FROM
    grp_member
WHERE
    member_status = 'active'
ORDER BY Joined;

SELECT 
    member_name, COUNT(*)
FROM
    grp_member
GROUP BY member_name
ORDER BY COUNT(*) DESC;

-- EVENT
/*The avarage event duration of all events is 10.769 seconds which is equal to 3 hours.*/
SELECT 
    AVG(duration)
FROM
    event;

-- CATEGORY
/*The Tech group category is the most popular category with 11,115 members*/
SELECT 
    category_name AS 'Group categories',
    COUNT(DISTINCT (member_id)) AS 'Members'
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
        JOIN
    grp_member ON grp.group_id = grp_member.group_id
GROUP BY category_name
ORDER BY Members DESC;
