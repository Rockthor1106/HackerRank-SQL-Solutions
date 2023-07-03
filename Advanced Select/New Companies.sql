--by @Rocthor1106
--reference The Coding Mentor on Youtube
SELECT c.company_code,
    founder,
    COUNT(DISTINCT l.lead_manager_code), --The challenge mentioned may contain duplicated values that's why the DISTINCT was used
    COUNT(DISTINCT s.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM company c
LEFT JOIN lead_manager l ON c.company_code = l.company_code
LEFT JOIN senior_manager s ON l.lead_manager_code = s.lead_manager_code
LEFT JOIN manager m ON s.senior_manager_code = m.senior_manager_code
LEFT JOIN employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code