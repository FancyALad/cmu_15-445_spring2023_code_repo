WITH actors AS (
    SELECT
        *
    FROM
        (SELECT
            category,
            titles.title_id AS title_id,
            primary_title,
            name,
            died,
            runtime_minutes,
            ROW_NUMBER() OVER (
                PARTITION BY 
                    category,
                    people.person_id 
                ORDER BY 
                    runtime_minutes DESC,
                    titles.title_id ASC
            ) AS rank_num_runtime
        FROM
            titles
            INNER JOIN crew ON titles.title_id = crew.title_id
            INNER JOIN people ON crew.person_id = people.person_id
        WHERE
            runtime_minutes IS NOT NULL
            AND died IS NOT NULL
        )
    WHERE
        rank_num_runtime = 1
)

SELECT
    *
FROM
    (SELECT
        category,
        name,
        died,
        primary_title,
        runtime_minutes,
        ROW_NUMBER() OVER (
            PARTITION BY 
                category
            ORDER BY 
                died ASC,
                name ASC
        ) AS rank_num
    FROM
        actors
    )
WHERE
    rank_num <= 5;