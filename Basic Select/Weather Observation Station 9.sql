--by @Rockthor1106
SELECT DISTINCT city FROM station WHERE SUBSTR(city,1,1) NOT IN ('a','e','i','o','u');