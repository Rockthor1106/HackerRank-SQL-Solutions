--by @Rockthor1106
--without CTE (Common Table Expression) but it is not working in HackerRank because row_number() is not supported in MySQL 5.7
SELECT hacker_submission.submission_date, 
        (SELECT
    COUNT(*) AS submissions_per_day
    FROM (
        SELECT submission_date, 
        hacker_id,
        COUNT(hacker_id) AS hacker_submissions_count,
        ROW_NUMBER() OVER (PARTITION BY hacker_id ORDER BY submission_date) AS submission_index,
        ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(hacker_id) DESC, MIN(hacker_id)) AS ranking_submission_index
        FROM submissions
        GROUP BY submission_date, hacker_id
    ) AS cte_submissions_stats
    WHERE DAY(submission_date) - submission_index = 0
    GROUP BY submission_date), 
        hacker_rank.hacker_id, 
        h.name
FROM (
    SELECT submission_date, 
    COUNT(*) AS submissions_per_day
    FROM (
        SELECT submission_date, 
        hacker_id,
        COUNT(hacker_id) AS hacker_submissions_count,
        ROW_NUMBER() OVER (PARTITION BY hacker_id ORDER BY submission_date) AS submission_index,
        ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(hacker_id) DESC, MIN(hacker_id)) AS ranking_submission_index
        FROM submissions
        GROUP BY submission_date, hacker_id
    ) AS cte_submissions_stats
    WHERE DAY(submission_date) - submission_index = 0
    GROUP BY submission_date
) AS hacker_submission
JOIN (
    SELECT hacker_id, submission_date
    FROM (
        SELECT submission_date, 
        hacker_id,
        COUNT(hacker_id) AS hacker_submissions_count,
        ROW_NUMBER() OVER (PARTITION BY hacker_id ORDER BY submission_date) AS submission_index,
        ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(hacker_id) DESC, MIN(hacker_id)) AS ranking_submission_index
        FROM submissions
        GROUP BY submission_date, hacker_id
    ) AS cte_submissions_stats
    WHERE ranking_submission_index = 1
) AS hacker_rank ON hacker_submission.submission_date = hacker_rank.submission_date
JOIN hackers h ON hacker_rank.hacker_id = h.hacker_id;


--with CTE (Common Table Expression) It runs if you use ms sql server in HackerRank but not in MySQL
WITH cte_submissions_stats AS (
        SELECT submission_date, 
        hacker_id,
        COUNT(hacker_id) AS hacker_submissions_count,
        ROW_NUMBER() OVER (PARTITION BY hacker_id ORDER BY submission_date) AS submission_index,
        ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(hacker_id) DESC, MIN(hacker_id)) AS ranking_submission_index
        FROM submissions
        GROUP BY submission_date, hacker_id
), 
hacker_submission AS (
    SELECT submission_date, 
    COUNT(*) AS submissions_per_day
    FROM cte_submissions_stats
    WHERE DAY(submission_date) - submission_index = 0
    GROUP BY submission_date
),
hacker_rank AS (
    SELECT hacker_id, submission_date
    FROM cte_submissions_stats
    WHERE ranking_submission_index = 1
)

SELECT hs.submission_date, hs.submissions_per_day, hr.hacker_id, h.name
FROM hacker_submission hs 
JOIN hacker_rank hr ON hs.submission_date = hr.submission_date
JOIN hackers h ON hr.hacker_id = h.hacker_id;

----------------------------
SELECT SUBMISSION_DATE, 
(SELECT COUNT(DISTINCT HACKER_ID)  
 FROM submissions S2  
 WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE AND    
(SELECT COUNT(DISTINCT S3.SUBMISSION_DATE) 
 FROM submissions S3 WHERE S3.HACKER_ID = S2.HACKER_ID AND S3.SUBMISSION_DATE < S1.SUBMISSION_DATE) = DATEDIFF(S1.SUBMISSION_DATE , '2016-03-01')),
(SELECT HACKER_ID FROM submissions S2 WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE
GROUP BY HACKER_ID ORDER BY COUNT(SUBMISSION_ID) DESC, HACKER_ID LIMIT 1) AS TMP,
(SELECT NAME FROM hackers WHERE HACKER_ID = TMP)
FROM submissions S1
GROUP BY SUBMISSION_DATE;
