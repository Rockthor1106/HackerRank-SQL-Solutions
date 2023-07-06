--by @Rockthor1106
SELECT hacker_id, name, SUM(max_score) AS total_score
FROM (
    SELECT h.hacker_id, h.name, s.challenge_id, MAX(score) AS max_score
    FROM submissions s
    JOIN hackers h ON h.hacker_id = s.hacker_id
    GROUP BY hacker_id, name, challenge_id
) AS new_table
GROUP BY hacker_id, name
HAVING total_score <> 0
ORDER BY total_score DESC, hacker_id;