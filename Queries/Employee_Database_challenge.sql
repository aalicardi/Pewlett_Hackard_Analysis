-- DELIVERABLE ONE
-- List of retiring employees and their titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date between '1952-01-01' and '1955-12-31')
ORDER BY emp_no;
	
SELECT * FROM retirement_titles limit 10;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

-- Number of retiring employees by most recent title
SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) desc;

SELECT * FROM retiring_titles;

-- DELIVERABLE TWO
-- Employees eligible to participate in mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employees as de on (e.emp_no = de.emp_no)
INNER JOIN titles as t on (e.emp_no = t.emp_no)
WHERE de.to_date = '9999-01-01' and (e.birth_date between '1965-01-01' and '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility 
