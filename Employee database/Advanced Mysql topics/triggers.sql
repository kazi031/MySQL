USE employees;

COMMIT;

-- Before insert

DROP TRIGGER IF EXISTS before_salaries_insert;

DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = 0;
	END IF;
END $$
DELIMITER ;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 10001;
        
INSERT INTO salaries VALUES ('10001', 90000, '2010-06-22', '9999-01-01');


-- before update
DROP TRIGGER IF EXISTS before_salary_update;

DELIMITER $$
USE employees$$
CREATE TRIGGER before_salary_update
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = OLD.salary;
	END IF;
END $$
DELIMITER ;


UPDATE salaries 
SET 
    salary = 20000
WHERE
    emp_no = 10001
        AND from_date = '2010-06-22';

/*
DELETE FROM salaries 
WHERE
    emp_no = 10001
    AND from_date = '2010-06-22';*/
-- to_char in mysql
SELECT DATE_FORMAT(SYSDATE(), '%d-%m-%Y') as today;
ROLLBACK;