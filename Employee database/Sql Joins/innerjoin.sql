SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;
-- inner join syntax join on/inner join on
SELECT 
    d2.emp_no, d1.dept_name, d1.dept_no, d2.from_date
FROM
    departments_dup d1
        INNER JOIN
    dept_manager_dup d2 ON d1.dept_no = d2.dept_no;
-- the columns with same data's name may not be same

-- null values are not displayed

-- emp_no,first_name,last_name,dept_no,hire_date of all managers
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager_dup d ON e.emp_no = d.emp_no
ORDER BY emp_no;
