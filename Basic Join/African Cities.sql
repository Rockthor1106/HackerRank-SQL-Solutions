--by @Rockthor1106 
--It is possible to use AND or WHERE to add a join condition.
--If we use JOIN it apply an INNER JOIN by default.
SELECT city.name FROM city
JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Africa';