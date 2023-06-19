--by @Rockthor1106
SELECT CASE 
    WHEN a + b <= c THEN 'Not A Triangle'
    WHEN a = b AND a = c THEN 'Equilateral' 
    WHEN a = b OR a = c OR b = c THEN 'Isosceles'
    WHEN a <> b AND a <> c AND b <> c THEN 'Scalene'
END
FROM triangles;