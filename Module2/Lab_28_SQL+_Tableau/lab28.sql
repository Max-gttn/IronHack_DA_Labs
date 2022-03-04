USE employees_mod;

SELECT
	emp_no, from_date, to_date
FROM t_dept_emp;

#1
SELECT
	YEAR(d.from_date) as calendar_year
    ,e.gender
    ,count(e.emp_no) as num_employees
FROM t_employees e
JOIN t_dept_emp d
	ON d.emp_no = e.emp_no
GROUP BY calendar_year, e.gender
HAVING calendar_year >= 1990;

#2 Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.
SELECT
	YEAR(d.from_date) as calendar_year
    ,e.gender
    ,count(e.emp_no) as num_employees
    ,dp.dept_name
FROM t_employees e
JOIN t_dept_emp d
	ON d.emp_no = e.emp_no
JOIN t_departments dp
	ON d.dept_no = dp.dept_no
GROUP BY calendar_year, dp.dept_name, e.gender
HAVING calendar_year >= 1990;

#3 Compare the average salary of female versus male employees in the entire company until year 2002,
# and add a filter allowing you to see that per each department.
SELECT
	YEAR(d.from_date) as calendar_year
    ,e.gender
    ,count(e.emp_no) as num_employees
    ,dp.dept_name
    ,AVG(s.salary) as avg_salary
FROM t_employees e
JOIN t_dept_emp d
	ON d.emp_no = e.emp_no
JOIN t_salaries s
	ON s.emp_no = e.emp_no
JOIN t_departments dp
	ON d.dept_no = dp.dept_no
GROUP BY calendar_year, dp.dept_name, e.gender
HAVING calendar_year >= 1990;

#4 Create an SQL stored procedure that will allow you to obtain the average male and female salary per department
# within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure.
# Finally, visualize the obtained result-set in Tableau as a double bar chart.
