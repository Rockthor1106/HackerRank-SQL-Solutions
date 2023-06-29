--by @Rockthor1106
--reference The Coding Mentor on Youtube
WITH actor AS (--Creates a temporary table called actor with the name of people who are actors
    SELECT name,
    ROW_NUMBER() OVER (ORDER BY name) AS row_index
    FROM occupations
    WHERE occupation LIKE 'Actor'
),
doctor AS (--Creates a temporary table called actor with the name of people who are doctors
    SELECT name,
    ROW_NUMBER() OVER (ORDER BY name) AS row_index
    FROM occupations
    WHERE occupation LIKE 'Doctor'
),
professor AS (--Creates a temporary table called actor with the name of people who are professors
    SELECT name,
    ROW_NUMBER() OVER (ORDER BY name) AS row_index
    FROM occupations
    WHERE occupation LIKE 'Professor'
),
singer AS (--Creates a temporary table called actor with the name of people who are singers
    SELECT name,
    ROW_NUMBER() OVER (ORDER BY name) AS row_index
    FROM occupations
    WHERE occupation LIKE 'Singer'
)
--row_index is used to make the join possible
SELECT d.name, p.name, s.name, a.name
FROM professor p --Here was selected firstly the professor table because it has the most rows 
LEFT JOIN actor a ON p.row_index = a.row_index
LEFT JOIN doctor d ON p.row_index = d.row_index
LEFT JOIN singer s ON p.row_index = s.row_index