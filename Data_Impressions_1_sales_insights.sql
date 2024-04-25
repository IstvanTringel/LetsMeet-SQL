
-- Active Cities
/*What cities have active members?
Chicago, Chicago Heights, Chicago Park, Chicago Ridge, East Chicago, New York, New York Mills, North Chicago, San Francisco, South San Francisco, West Chicago and
West New York have active members.

Are there any cities listed in the city table with no active members? If so, what state are those cities in?
There are no cities listed in city table with no active members.*/
SELECT DISTINCT
    (city)
FROM
    grp_member 
UNION SELECT DISTINCT
    (city)
FROM
    city
ORDER BY city;

SELECT 
    city, member_count
FROM
    city
ORDER BY member_count;

-- Groups
/*How many groups are currently open, waiting for approcal and/or closed?
3602 groups are open
723 groups are waiting for approval
15 groups are closed*/
SELECT 
    join_mode, COUNT(*)
FROM
    grp
GROUP BY join_mode;

-- Categories
/*What are the five categories that contain the most groups?
What are the five categories that contain the least number of groups?
Tech(911), Career&Business(790), Socializing(320), Health&Wellbeing(218), Language&Ethnic Identity(166) contain the most groups.
Paranormal(4), Cars&Motorcycles(15), Sci-Fi&Fantasy(16),Lifestyle(26),Hobbie&Crafts(32) contain the least number of groups.*/

SELECT 
    grp.category_id, category_name, COUNT(*)
FROM
    grp
        JOIN
    category ON grp.category_id = category.category_id
GROUP BY category_name
ORDER BY COUNT(*) DESC
LIMIT 5;

SELECT 
    grp.category_id, category_name, COUNT(*)
FROM
    grp
        JOIN
    category ON grp.category_id = category.category_id
GROUP BY category_name
ORDER BY COUNT(*)
LIMIT 5;

-- Members
/*How many members are there?
What percentage of members are in Chicago?
There are 382,351 member from which 39,980 are also part of a group
4.13835% of all members are from Chicago*/

SELECT 
    COUNT(DISTINCT (member_id))
FROM
    grp_member;
    
SELECT 
    SUM(member_count)
FROM
    city;

SELECT 
    SUM(member_count) / (SELECT 
            SUM(member_count)
        FROM
            city
        WHERE
            state = 'IL') AS "Percentage of All Members from Chicago"
FROM
    city;