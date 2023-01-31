use employees;
-- show all the contracts of a given employee
DROP PROCEDURE IF EXISTS emp_contracts;

DELIMITER $$
USE employees$$
CREATE PROCEDURE emp_contracts(IN in_emp_no INTEGER)
BEGIN
	SELECT 
		e.first_name, e.last_name, s.salary, s.from_date, s.to_date
	FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = in_emp_no;
END$$
DELIMITER ;

commit;

-- one input parameter can also be used with aggregate function
-- SHOW THE AVERAGE SALARY OF A GIVEN EMPLOYEE
DROP PROCEDURE IF EXISTS emp_avg_salary;
DELIMITER $$
USE employees$$
CREATE PROCEDURE emp_avg_salary(IN in_emp_no INT)
BEGIN
	SELECT 
		e.first_name, e.last_name,ROUND(AVG(s.salary),2) AS avg_salary
	FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = in_emp_no;
END$$
DELIMITER ;

call employees.emp_avg_salary(11300);