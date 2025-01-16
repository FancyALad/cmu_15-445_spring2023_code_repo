WITH rose_films AS (
    SELECT
        DISTINCT(title_id) AS title_id
    FROM
        people
        INNER JOIN crew ON people.person_id = crew.person_id
    WHERE
        name LIKE 'Rose%' AND
        category = 'actress'
)

SELECT 
    DISTINCT(name) AS director_name
FROM
    rose_films
    INNER JOIN (
        SELECT
            person_id, title_id
        FROM
            crew
        WHERE
            category = 'director'
    ) AS directors ON rose_films.title_id = directors.title_id
    INNER JOIN people ON directors.person_id = people.person_id
ORDER BY
    director_name ASC;