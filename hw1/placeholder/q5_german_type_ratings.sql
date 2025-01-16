SELECT type, ROUND(AVG(rating), 2) AS avg, MIN(rating), MAX(rating)
FROM (SELECT titles.title_id, type
        FROM titles
        JOIN akas ON akas.title_id = titles.title_id
        WHERE language = 'de' AND 
        (types = 'imdbDisplay' or types = 'original')) AS german_titles
JOIN ratings ON german_titles.title_id = ratings.title_id
GROUP BY type
ORDER BY avg;