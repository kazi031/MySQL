-- AFTER INSERT

DROP FUNCTION IF EXISTS emp_info_2;

DELIMITER $$
USE employees$$
CREATE FUNCTION emp_info_2(in_emp_no INT(11)) RETURNS DECIMAL(10,2)
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
		e.emp_no = in_emp_no
			AND s.from_date IN (SELECT 
				MAX(s.from_date)
			FROM
				salaries s
					JOIN
				employees e ON s.emp_no = e.emp_no
			WHERE
				e.emp_no = in_emp_no
			GROUP BY s.emp_no);
    RETURN out_salary;
END$$
DELIMITER ;

-- Now we will apply trigger in dept_manager table
COMMIT;

DROP TRIGGER IF EXISTS after_dept_man_ins;

DELIMITER $$
USE employees $$
CREATE TRIGGER after_dept_man_ins
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE curr_sal DECIMAL(10,2);
    SELECT emp_info_2(NEW.emp_no) INTO curr_sal;
    IF curr_sal IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = new.emp_no
			AND to_date = new.to_date;
		
        INSERT INTO salaries values(NEW.emp_no,curr_sal + 20000,NEW.from_date,NEW.to_date);
	END IF;
END $$
DELIMITER ;

INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%Y-%m-%d'), '9999-01-01');

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;

ROLLBACK;