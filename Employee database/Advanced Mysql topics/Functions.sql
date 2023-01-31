-- Unless we specify what the exact behavior of our function should be, our code will lead to an error. 
-- This error is with code 1418 and states that the function has none of the following characteristics in its declaration: DETERMINISTIC, NO SQL, or READS SQL DATA.

--  DETERMINISTIC – it states that the function will always return identical result given the same input
--  NO SQL – means that the code in our function does not contain SQL (rarely the case)
--  READS SQL DATA – this is usually when a simple SELECT statement is present

-- When none of those is present in our code, MySQL assumes that our function is non deterministic and that it changes data.
-- This might not be the case, but still, in the end, an error is raised just because MySQL cannot know a priori what our function will do.

-- SET @@global.log_bin_trust_function_creators := 1;
-- by applying this we can deactive binary log


USE employees;

DROP FUNCTION IF EXISTS avg_salary_func;

DELIMITER $$
CREATE FUNCTION avg_salary_func(in_emp_no INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE out_salary DECIMAL(10,2);
	SELECT 
		AVG(s.salary)
	INTO out_salary FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = in_emp_no;
	RETURN out_salary;
END$$
DELIMITER ;

SELECT avg_salary_func(11300);

COMMIT;

-- Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

DROP FUNCTION IF EXISTS emp_info;

DELIMITER $$
USE employees$$
CREATE FUNCTION emp_info(f_name VARCHAR(100),l_name VARCHAR(100)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE out_salary DECIMAL(10,2);
    SELECT 
		s.salary
	INTO out_salary FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.first_name = f_name
			AND e.last_name = l_name
			AND s.from_date IN (SELECT 
				MAX(s.from_date)
			FROM
				salaries s
					JOIN
				employees e ON s.emp_no = e.emp_no
			WHERE
				e.first_name = f_name
					AND e.last_name = l_name
			GROUP BY s.emp_no);
    RETURN out_salary;
END$$
DELIMITER ;

SELECT emp_info('Aruna', 'Journel') AS salary;

-- function can be used inside a select statement

SELECT 
    e.first_name, e.last_name, AVG_SALARY_FUNC(e.emp_no) as avg_salary
FROM
    employees e
LIMIT 100;



        