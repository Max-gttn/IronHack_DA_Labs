# create database
DROP DATABASE IF EXISTS employees_mod;
CREATE DATABASE IF NOT EXISTS employees_mod; 
USE employees_mod;

# Create a procedure that will provide the average salary of all employees.

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT avg(salary)
FROM t_salaries;
END$$
DELIMITER ;

CALL avg_salary;

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual
# and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info(firstName nvarchar(20), lastName nvarchar(20))
BEGIN
SELECT emp_no
FROM t_employees
WHERE first_name = firstName and last_name = lastName;
END$$
DELIMITER ;

CALL emp_info('Patricio','Bridgland');

# Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee,
# and returns the salary from the newest contract of that employee. 
# Hint: In the BEGIN-END block of this program, 
# you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, 
# that will be of the DECIMAL (10,2) type.

DELIMITER $$
CREATE PROCEDURE emp_salary(firstName nvarchar(20), lastName nvarchar(20))
BEGIN
SELECT s.salary as last_salary
FROM t_salaries s
LEFT JOIN t_employees e
	ON e.emp_no = s.emp_no
WHERE e.first_name = firstName and e.last_name = lastName and s.from_date = (
	SELECT max(s.from_date) 
    FROM t_salaries s
    LEFT JOIN t_employees e
	ON e.emp_no = s.emp_no
    WHERE e.first_name = firstName and e.last_name = lastName)
;
END$$
DELIMITER ;

CALL emp_salary('Patricio','Bridgland');

# Create a trigger that checks if the hire date of an employee is higher than the current date.
# If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)
DROP TRIGGER before_employees_insert;
DELIMITER $$

CREATE TRIGGER before_employees_insert
BEFORE INSERT ON t_employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date > CURDATE() THEN 
		SET NEW.hire_date = DATE_FORMAT(CURDATE(),'%Y-%m-%d');
	END IF;
END $$

DELIMITER ;

INSERT INTO t_employees
VALUES ROW(11,'1989-02-01','Maxime','JHIO','M','2022-02-01')
;

#Drop the ‘i_hire_date’ index.
ALTER TABLE t_employees
DROP INDEX i_hire_date;

#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
SELECT * FROM t_salaries
WHERE salary > 89000;

CREATE INDEX i_salary ON t_salaries(salary);

#Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees 
#with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager,
# according to the data provided in the dept_manager table, or a regular employee.

SELECT e.emp_no, e.first_name, e.last_name,
	CASE
		WHEN dm.emp_no = e.emp_no THEN 'manager'
		ELSE 'regular'
	END AS status_employee
FROM t_employees e
LEFT JOIN t_dept_manager dm
	ON e.emp_no = dm.emp_no
WHERE e.emp_no > 109990;

# Extract a dataset containing the following information about the managers: 
# employee number, first name, and last name. Add two columns at the end – one showing the difference between 
# the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
WITH t_manager AS (
SELECT e.emp_no as employee_no, e.first_name as firstName, e.last_name as lastName,
	CASE
		WHEN dm.emp_no = e.emp_no THEN 'manager'
		ELSE 'regular'
	END AS status_employee
FROM t_employees e
LEFT JOIN t_dept_manager dm
	ON e.emp_no = dm.emp_no
    )
SELECT employee_no, firstName, lastName, max(salary) - min(salary) as diff,
	CASE
		WHEN max(salary) - min(salary) > 30000 THEN 'higher'
		ELSE 'not'
	END AS status_raise
FROM t_manager m
LEFT JOIN t_salaries s
	ON m.employee_no = s.emp_no
WHERE status_employee = 'manager'
GROUP BY employee_no
;

# Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
# called “current_employee” saying “Is still employed” if the employee is still working in the company, 
# or “Not an employee anymore” if they aren’t. 
# Hint: You’ll need to use data from both the ‘employees’ 
# and the ‘dept_emp’ table to solve this exercise.
SELECT d.emp_no, e.first_name, e.last_name,
CASE
	WHEN d.to_date < DATE_FORMAT(CURDATE(),'%Y-%m-%d') THEN 'Not an employee anymore'
    ELSE 'Is still employed'
END AS current_employee
FROM t_dept_emp d
LEFT JOIN t_employees e
	ON e.emp_no = d.emp_no
;