WITH batman_actors AS (
    SELECT 
        DISTINCT(people.person_id) AS id, 
        name
    FROM 
        people
        INNER JOIN crew ON people.person_id = crew.person_id
    WHERE 
        crew.characters LIKE '%"Batman"%' 
        AND category = 'actor'
)

SELECT 
    name, 
    ROUND(AVG(rating), 2) AS avg
FROM 
    ratings
    INNER JOIN crew ON ratings.title_id = crew.title_id
    INNER JOIN batman_actors ON crew.person_id = batman_actors.id
GROUP BY 
    id
ORDER BY 
    avg DESC
LIMIT 
    10;
