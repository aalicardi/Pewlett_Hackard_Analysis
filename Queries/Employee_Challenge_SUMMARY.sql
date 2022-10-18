-- How many roles will need to be filled
SELECT title, COUNT(title) as count, sum(count(title)) over() as total_count
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title)

-- How many employees are eligible to mentor
SELECT COUNT(emp_no)
FROM mentorship_eligibility;