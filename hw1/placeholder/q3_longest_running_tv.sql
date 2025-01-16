SELECT primary_title, IFNULL(ended, 2023) - premiered AS TIME_RUNNING
From titles
WHERE type = 'tvSeries' AND premiered IS NOT NULL
ORDER BY TIME_RUNNING DESC, primary_title ASC
LIMIT 20;
