--by @Rockthor1106
/*It is not neccessary to add an extra order by param (marks) since
the name for students with grades lower than 8 is NULL so name filter
is ignored, so it applies the order by grade and by default the data
has a ascending order for the marks column*/
SELECT IF(grade >= 8, name, NULL), grade, marks 
FROM students JOIN grades
WHERE marks BETWEEN min_mark AND max_mark
ORDER BY grade DESC, name