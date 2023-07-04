--by @Rockthor1106
SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands w
JOIN wands_property wp ON w.code = wp.code 
WHERE wp.is_evil <> 1 
AND w.coins_needed = (
    SELECT MIN(wa.coins_needed) AS min_galleons
    FROM wands wa
    JOIN wands_property wap ON wa.code = wap.code
    WHERE w.power = wa.power AND wp.age = wap.age
)
ORDER BY w.power DESC, wp.age DESC;