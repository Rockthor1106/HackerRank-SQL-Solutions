--by @Rockthor1106
SELECT DISTINCT city FROM station WHERE SUBSTR(city,LENGTH(city),1) NOT IN ('a','e','i','o','u');