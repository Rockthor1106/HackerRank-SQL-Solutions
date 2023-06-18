--by @Rockthor1106
--The parameter of SUBSTR city,1,1 means that we are selecting the first letter of the city name
SELECT city FROM station WHERE SUBSTR(city,1,1) IN ('a','e','i','o','u');