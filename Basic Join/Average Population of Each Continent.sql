--by @Rockthor1106
SELECT country.continent, FLOOR(AVG(city.population)) FROM country 
JOIN city ON city.countrycode = country.code 
GROUP BY country.continent;