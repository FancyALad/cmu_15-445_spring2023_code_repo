--learn to use json_each() to extract json data
WITH leo_s_characters AS (
    SELECT
        DISTINCT ch.value AS c
    FROM
        crew
        INNER JOIN (
        SELECT
            person_id
        FROM
            people
        WHERE
            name = 'Leonardo DiCaprio'
            AND born =  1974
        ) AS p ON crew.person_id = p.person_id, 
        json_each(crew.characters) AS ch
    WHERE
        characters IS NOT NULL
        AND c NOT LIKE '%Self%'
    ORDER BY
        c
)

SELECT 
    GROUP_CONCAT(c) 
FROM 
    leo_s_characters;