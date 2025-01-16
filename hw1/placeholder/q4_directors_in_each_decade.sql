SELECT b || 's', count(DISTINCT(person_id)) AS num_directors
FROM(SELECT (born / 10) * 10 AS b, people.person_id AS id
    FROM  people
    WHERE born >= 1900
    )AS p
JOIN crew ON p.id = crew.person_id
WHERE category = 'director'
GROUP BY b
ORDER BY b;