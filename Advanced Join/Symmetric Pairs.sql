--by @Rockthor1106
WITH reversed_table AS (
    SELECT ROW_NUMBER() OVER(ORDER BY x) as row_index, y, x
    FROM functions
),
functions_table AS (
    SELECT ROW_NUMBER() OVER(ORDER BY x) as row_index, x, y
    FROM functions
)

SELECT DISTINCT ft.x, ft.y
FROM functions_table ft
JOIN reversed_table rt ON ft.x = rt.y 
AND ft.y = rt.x
AND ft.row_index <> rt.row_index
AND ft.x <= ft.y;