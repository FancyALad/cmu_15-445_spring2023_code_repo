SELECT premiered, primary_title || ' (' || original_title || ')'
From titles
WHERE type = 'movie' 
    AND primary_title <> original_title 
    AND genres LIKE '%Action%'
ORDER BY premiered DESC, primary_title ASC
LIMIT 10;
