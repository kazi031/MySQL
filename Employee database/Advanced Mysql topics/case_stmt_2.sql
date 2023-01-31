-- Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
-- Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether 
-- this salary raise was higher than $30,000 or NOT.

DROP FUNCTION IF EXISTS sal_diff;
DELIMITER $$
USE employees $$
CREATE FUNCTION sal_diff(max_sal INT,min_sal INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE diff_sal INT;
	IF max_sal <= 0 THEN SET diff_sal = 0;
    ELSE SET diff_sal = max_sal - min_sal;
    END IF;
    RETURN diff_sal;
END $$
DELIMITER ;




SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    sal_diff(max(salary),min(salary)) as salary_difference,
    CASE
        WHEN MAX(salary) - MIN(salary) > 30000 THEN 'raise > 30000'
        WHEN MAX(salary) - MIN(salary) BETWEEN 20000 AND 30000 THEN '20000 < raise < 30000'
        ELSE 'raise < 20000'
    END AS raise
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
GROUP BY dm.emp_no;
