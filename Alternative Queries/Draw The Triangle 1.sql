--by @Rockthor 
SET @n := 21;--it initializes and set a value for a variable @n

SELECT REPEAT('* ', @n := @n - 1)--This decrements @n by one each time it is called, so @n starts with 20 value
FROM information_schema.tables;