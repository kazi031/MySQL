use employees;

drop procedure if exists select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
begin 
	SELECT * FROM employees
    LIMIT 100;
end$$
DELIMITER ;

call employees.select_employees();

-- Create a procedure that will provide the average salary of all employees.
-- we can also right click on stored procedure and create a new procedure
DROP PROCEDURE IF EXISTS emp_avg_salary

DELIMITER $$
CREATE PROCEDURE emp_avg_sal()
BEGIN
	SELECT ROUND(AVG(salary),2) AS avg_salary FROM salaries;
END$$
DELIMITER ;

call employees.emp_avg_sal();
-- how to drop a stored procedure
DROP PROCEDURE emp_avg_sal;
