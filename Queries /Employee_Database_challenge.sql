-- Retrieve the emp_no, first name, and last name from Employees table.

SELECT emp_no,first_name, last_name
FROM employees;

SELECT * 
FROM unique_titles;

--Retrieve the title, from_date, and to_date columns from the Titles table.
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
