# Pewlett-Hackard-Analysis

## Purpose  
With the expectation of Pewlett Hackard having many employees approaching retirement age, they want us to perform an analysis to determine the amount of employees that are expected to enter retirement age (employees born between 1952 and 1955).  We want to find the amount of employees retiring based on their title.  In an effort to replace these retiring employees who tend to have more senior based roles, the company also wants to begin a mentorship program for a specific group of employees (employees born during the year of 1965).  We want to create a query that can provide the names of the employees who meet the criteria for the mentorship program.  We're hoping by completing this, we can create a pipe line to replace some of the retiring senior roles with some of the in house employees.

## Results

### Deliverable #1 Potential Retiree Tables

For the first deliverable, we want to create tables that can list the employees who fit the retirement criteria as well as their titles.  When we run our varioues queries, here are the results that we got:

1.When we run the following code 
```
SELECT COUNT(unique_titles.title)
FROM unique_titles
```
 we are able to determine that there are a total of 90,398 openings that can come from potential retirees in the coming years. 
 
 
 2. When we create a table that breaks down the retirees by job title, we can see that more than 50% of the potential retirees hold "senior" titles.  This will be something we need to reference when looking at the amount of employees that may qualify for the mentorship program.
 
 <img width="277" alt="Screen Shot 2021-11-27 at 3 55 55 PM" src="https://user-images.githubusercontent.com/87248687/143732592-e1e1c00e-db7a-4142-af62-2285bdb76182.png">

 
 
 ### Deliverable #2 Mentorship Program Table 
 
 1. We use this query to create a table listing all of the active employees who qualify for the mentorship program based on the aforementioned criteria.

```
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
```
Here are some of the employees in that table.

<img width="713" alt="Screen Shot 2021-11-27 at 4 21 51 PM" src="https://user-images.githubusercontent.com/87248687/143732556-b71dd908-f006-4345-aa42-6ac329802403.png">



2.When we use a query to count all of the employees inside of our mentorship_eligibility table, we see that there are 1,549 employees that qualify for the program.

<img width="138" alt="Screen Shot 2021-11-28 at 1 50 04 AM" src="https://user-images.githubusercontent.com/87248687/143732604-eb066cf2-143e-4fca-ab31-20ec48e296bf.png">




## Summary

As the employees who are eligible for retirement begin to retire during the next few years, there will be a major need to replace them.  As of now, there are projected to be 90,398 openings that will be need to replaced.

<img width="115" alt="Screen Shot 2021-11-27 at 4 10 29 PM" src="https://user-images.githubusercontent.com/87248687/143733201-5e943c0b-9256-4bff-b5ba-a9e29ea6ddc6.png">


While there are plenty of qualified retirement-ready employees ready to mentor the next generation of senior Pewlett Hackard employees, there are no where enough eligibile employees for the mentorship program that will fill this void.  

When we use this query
```
SELECT COUNT(mentorship_eligibility.title)
FROM mentorship_eligibility
```
we realize that there are only 1,549 employees that qualify for the mentorship program.  If there are going for be 90,398 openings from retirement, the company will have to either expand their mentorship program to more employees based on tenure or extend the age range for employees to qualify.  Due to the large void, the company may also have to look to fill some of these senior roles externally.






 
 

 
