--by @Rockthor1106
SELECT SUM(city.population) FROM city 
JOIN country WHERE city.countrycode = country.code AND country.continent = 'Asia';