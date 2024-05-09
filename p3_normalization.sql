SET SQL_SAFE_UPDATES=0;

ALTER TABLE venue_
DROP COLUMN address_2;

ALTER TABLE venue_
DROP COLUMN country;

ALTER TABLE venue_
DROP COLUMN distance;

ALTER TABLE venue_
DROP COLUMN localized_country_name;

ALTER TABLE venue_
DROP COLUMN state;

ALTER TABLE venue_
DROP COLUMN phone;

ALTER TABLE venue_
DROP COLUMN 'RAND()';

ALTER TABLE city
DROP COLUMN localized_country_name;

ALTER TABLE city
DROP COLUMN distance;

ALTER TABLE city
DROP COLUMN country;

ALTER TABLE event
DROP COLUMN headcount;

ALTER TABLE event
DROP COLUMN utc_offset;

ALTER TABLE event
DROP COLUMN maybe_rsvp_count;

ALTER TABLE event
DROP COLUMN why;

ALTER TABLE event
DROP COLUMN visibility;

ALTER TABLE category
DROP COLUMN sort_name;

ALTER TABLE category
DROP COLUMN shortname;

ALTER TABLE grp_member
DROP COLUMN country;
/*Removed the columns above, as they are already present in another table or redundant/uninformative columns. I was not able the remove the 'RAND()' column from the venue_ table due to an unknown SQL syntax error*/

CREATE TABLE group_sign_ups
SELECT distinct
group_id,
member_id,
joined
FROM grp_member;

CREATE TABLE members
SELECT distinct
member_id,
member_name,
member_status,
city,
hometown
FROM grp_member;

ALTER TABLE members
ADD PRIMARY KEY (member_id);

ALTER TABLE group_sign_ups
ADD FOREIGN KEY (member_id) REFERENCES members(member_id);

ALTER TABLE group_sign_ups
ADD FOREIGN KEY (group_id) REFERENCES grp(group_id);

DROP TABLE grp_member;