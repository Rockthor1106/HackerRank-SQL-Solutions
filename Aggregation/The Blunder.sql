--by @Rockthor1106 
SELECT CEILING(AVG(salary) - AVG(REPLACE(salary,'0',''))) FROM employees;