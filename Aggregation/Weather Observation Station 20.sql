--by @Rockthor1106
--I tried to represent the two cases of odd and even number of rows in the table, because the calculus is different for each case.
--I limited with 1,1 because when the DISTINCT is applied first appears a NULL value, then the median value
SELECT DISTINCT ROUND(IF((SELECT COUNT(*) % 2 <> 0), 
          (SELECT lat_n WHERE CEILING((SELECT COUNT(*)/2 FROM station)) = row_index),
         (((SELECT lat_n WHERE (SELECT COUNT(*)/2 FROM station) = row_index)+(SELECT lat_n WHERE (SELECT COUNT(*)/2 FROM station) = (row_index + 1)))/2)), 4)
FROM(
    SELECT ROW_NUMBER() OVER (ORDER BY lat_n) AS row_index, lat_n FROM station
    ) AS numbered_rows
LIMIT 1,1