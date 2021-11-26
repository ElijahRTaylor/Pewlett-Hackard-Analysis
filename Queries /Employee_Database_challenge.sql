-- Deliverable 1

-- Retrieve the emp_no, first name, and last name from Employees table.

SELECT emp_no,first_name, last_name
FROM employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;
		

-- Created a table with employees who are of the age of retirement
SELECT DISTINCT ON (ep.emp_no) ep.emp_no,
       ep.first_name,
	   ep.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees AS ep
LEFT JOIN titles AS ti
ON ep.emp_no=ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Create a unique titles table to eliminate instances where there are duplicate rows for employees who changed titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no, from_date DESC;


-- Create a retiring titles to track the count of potential openings for the employees of retirement age.
SELECT COUNT(ut.title) AS "Retiring Titles COUNT", ut.title 
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY "Retiring Titles COUNT" DESC

-- DELIVERABLE 2
--Create a table of employees eligible for mentorship program based on their birth date.

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON(ep.emp_no) ep.emp_no,
       ep.first_name,
	   ep.last_name,
	   ep.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibility 
FROM employees AS ep
INNER JOIN dept_emp AS de
ON ep.emp_no=de.emp_no
INNER JOIN titles AS ti
ON ep.emp_no=ti.emp_no
WHERE (de.to_date='9999-01-01')
AND (ep.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY ep.emp_no;
