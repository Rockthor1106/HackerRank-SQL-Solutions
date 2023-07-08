--by @Rockthor1106  
WITH friend_salary_table AS (
    SELECT f.id, f.friend_id, salary
    FROM friends f
    JOIN packages p ON f.friend_id = p.id
    ORDER BY f.id
)

SELECT s.name
FROM students s 
JOIN packages p ON s.id = p.id
JOIN friend_salary_table fst ON p.id = fst.id
WHERE p.salary < fst.salary
ORDER BY fst.salary;