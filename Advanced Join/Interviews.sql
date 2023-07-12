--by @Rockthor1106
SELECT c.contest_id, c.hacker_id, c.name, 
        SUM(sum_total_submissions),
        SUM(sum_total_accepted_submissions), 
        SUM(sum_total_views), 
        SUM(sum_total_unique_views)
FROM contests c
JOIN colleges co ON c.contest_id = co.contest_id
JOIN challenges ch ON co.college_id = ch.college_id
LEFT JOIN (
    SELECT challenge_id, 
        SUM(total_submissions) AS sum_total_submissions,
        SUM(total_accepted_submissions) AS sum_total_accepted_submissions
    FROM submission_stats
    GROUP BY challenge_id
) AS cte_submission_stats ON cte_submission_stats.challenge_id = ch.challenge_id
LEFT JOIN (
    SELECT challenge_id,
    SUM(total_views) AS sum_total_views,
    SUM(total_unique_views) AS sum_total_unique_views
    FROM view_stats
    GROUP BY challenge_id
) AS cte_view_stats ON cte_view_stats.challenge_id = ch.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
ORDER BY c.contest_id; 