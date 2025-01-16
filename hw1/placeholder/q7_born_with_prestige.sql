SELECT
    COUNT(DISTINCT people.person_id)
FROM
    people
    INNER JOIN crew ON people.person_id = crew.person_id
WHERE
    born IN (
        SELECT
            premiered AS born
        FROM
            titles
        WHERE
            primary_title = 'The Prestige'
    )
    AND (
        category = 'actor' 
        OR category = 'actress'
    );

/*
SELECT
    COUNT(DISTINCT people.person_id)
FROM
    (SELECT
        premiered AS born
    FROM
        titles
    WHERE
        primary_title = 'The Prestige') AS prestige
    INNER JOIN people ON people.born = prestige.born
    INNER JOIN crew ON people.person_id = crew.person_id
WHERE
    category = 'actor' OR category = 'actress'
ORDER BY
    name;
*/