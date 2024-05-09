SELECT 
    city, COUNT(*)
FROM
    event
        JOIN
    venue_ ON event.venue_id = venue_.venue_id
WHERE
    event_name LIKE '%Toastmaster%'
        OR '%toastmaster%'
GROUP BY city;