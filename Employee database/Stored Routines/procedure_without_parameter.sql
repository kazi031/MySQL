

DROP PROCEDURE IF EXISTS emp_avg_salary;

DELIMITER $$
USE employees$$
CREATE PROCEDURE emp_avg_salary(IN in_emp_no INT, OUT out_avg_sal DECIMAL(10,2))
BEGIN
	SELECT 
		AVG(s.salary) into out_avg_sal
	FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = in_emp_no;
END$$
DELIMITER ;

-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
USE employees$$
CREATE PROCEDURE emp_info(IN in_first_name VARCHAR(40),IN in_last_name VARCHAR(40),OUT out_emp_no INT(11))
BEGIN
	SELECT 
		e.emp_no INTO out_emp_no
	FROM
		employees e
	WHERE
		e.first_name = in_first_name
			AND e.last_name = in_last_name;
END$$
DELIMITER ;





