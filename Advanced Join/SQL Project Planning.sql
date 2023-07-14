--by @Rockthor1106
WITH start_date_table AS (
    SELECT ROW_NUMBER() OVER (ORDER BY start_date) AS row_index, start_date
    FROM projects
    WHERE start_date NOT IN (SELECT end_date FROM projects)
),

end_date_table AS (
    SELECT ROW_NUMBER() OVER (ORDER BY start_date) AS row_index, end_date
    FROM projects
    WHERE end_date NOT IN (SELECT start_date FROM projects)
)

SELECT start_date, end_date
FROM start_date_table sd
JOIN end_date_table ed ON sd.row_index= ed.row_index
ORDER BY DATEDIFF(end_date, start_date), start_date;

