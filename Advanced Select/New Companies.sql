--by @Rocthor1106
SET @n := 21;

SELECT REPEAT('* ', @n := @n - 1)--This decrements @n by one each time it is called, so @n starts with 20 value
FROM information_schema.tables;