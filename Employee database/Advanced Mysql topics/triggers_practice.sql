-- Create a trigger that checks if the hire date of an employee is higher than the current date. 
-- If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).

DROP TRIGGER IF EXISTS after_emp_ins;

DELIMITER $$
USE employees $$
CREATE TRIGGER after_emp_ins
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	DECLARE v_curr_date DATE;
    SELECT SYSDATE() INTO v_curr_date;
    IF NEW.hire_date > v_curr_date THEN
		SET NEW.hire_date = v_curr_date;
    END IF;
END $$
DELIMITER ;


COMMIT;

INSERT INTO employees VALUES(998899,'1997-12-03','Justin','Kazi','M','2025-01-01');

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

rollback;

/*IF NEW.hire_date > date_format(sysdate(), '%y-%m-%d') THEN
SET NEW.hire_date = date_format(sysdate(), '%y-%m-%d');
END IF;*/