--by @Rockthor1106
WITH new_table AS (--this table contains the neccesary data and the amount of challenges each hacker has
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenges_count
    FROM hackers h
    JOIN challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
    ORDER BY COUNT(c.challenge_id) DESC
),

sec_new_table AS (--this table contains the amount of hackers that have the same amount of challenges
    SELECT challenges_count, COUNT(hacker_id) AS hackers_same_amount_challenges_count
    FROM new_table
    GROUP BY challenges_count
    HAVING COUNT(hacker_id) = 1 
    OR challenges_count = (SELECT challenges_count FROM new_table LIMIT 1) 
)

SELECT nt.hacker_id, nt.name, snt.challenges_count
FROM new_table nt
JOIN sec_new_table snt ON nt.challenges_count = snt.challenges_count
ORDER BY nt.challenges_count DESC, nt.hacker_id;
