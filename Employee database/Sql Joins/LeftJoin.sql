-- first removing the duplicate values
DELETE FROM dept_manager_dup 
WHERE
    emp_no = '110228';
    
DELETE FROM departments_dup 
WHERE
    dept_no = 'd009';
    
INSERT INTO dept_manager_dup
VALUES('110228','d003','1992-03-01','9999-01-01');

INSERT INTO departments_dup 
VALUES('d009','Customer Service');


SELECT 
    d1.emp_no, d1.dept_no, d2.dept_name, d1.from_date
FROM
    dept_manager_dup d1
        LEFT JOIN
    departments_dup d2 ON d1.dept_no = d2.dept_no
GROUP BY d1.emp_no
ORDER BY dept_no;

-- left join means => all matching values from both table + all the values from the left table that matches no values from the right table

-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
-- See if the output contains a manager with that name.
 
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    e.last_name = 'Markovitch'
GROUP BY e.emp_no
ORDER BY d.dept_no DESC , e.emp_no;
