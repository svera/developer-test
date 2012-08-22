-- Daily sales report
SELECT count(*) AS quantity
FROM bookings
WHERE created_at LIKE 'YYYY-MM-DD%' 

-- Best performer hotels of the day
SELECT h.id, h.name, count(b.*) AS quantity
FROM bookings AS b 
JOIN hotels h ON (b.hotel_id = h.id)
WHERE b.created_at LIKE 'YYYY-MM-DD%' 
ORDER BY quantity DESC
GROUP_BY h.id

-- Weekly accumulated sales
SELECT h.id, h.name, count(b.*) AS quantity
FROM bookings AS b 
JOIN hotels h ON (b.hotel_id = h.id)
WHERE DATE_SUB(CURDATE(), INTERVAL 1 WEEK) <= created_at
ORDER BY h.name
GROUP_BY h.id

