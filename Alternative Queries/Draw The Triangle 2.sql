--by @Rockthor1106
SET @n := 0;
SELECT REPEAT('* ', @n := @n + 1)
FROM information_schema.tables
WHERE @n < 20;