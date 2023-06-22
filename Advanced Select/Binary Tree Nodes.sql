--by @Rockthor
SELECT n, IF(COUNT(p) = 0, 'Root',
            IF(n IN (SELECT p FROM bst), 'Inner', 'Leaf'))
FROM bst 
GROUP BY n
ORDER BY n;