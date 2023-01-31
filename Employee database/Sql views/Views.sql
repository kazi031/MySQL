SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    de.*, COUNT(from_date) AS NUM
FROM
    dept_emp de
GROUP BY emp_no
HAVING NUM > 1;

-- creating views
-- visualize only the period encompassing the last contract of each employee

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
    
SELECT 
    *
FROM
    employees.v_dept_emp_latest_date;
    
-- exersize
-- Create a view that will extract the average salarirs of all the managers registered in the database. Round this value to the nearest cent.
CREATE OR REPLACE VIEW v_manager_avg_sal AS
    SELECT 
        dm.emp_no, ROUND(AVG(s.salary), 2) as avg_sal
    FROM
        dept_manager dm
            JOIN
        salaries s ON dm.emp_no = s.emp_no
    GROUP BY dm.emp_no
    ORDER BY dm.emp_no;
    
commit;


    
    