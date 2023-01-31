-- right join is same as left join
-- right and left join are good examples of one-to-many relationships

SELECT 
    *
FROM
    dept_manager_dup;
    
SELECT 
    *
FROM
    departments_dup;

-- dept_manager_dup and departments_dup have one to many relationship
-- one department can have multiple dept_manager

SELECT 
    m.emp_no, d.dept_no, d.dept_name
FROM
    departments_dup d
        RIGHT JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no
GROUP BY emp_no
ORDER BY dept_no;

-- old style of join
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
-- Use the old type of join syntax to obtain the result.
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e,
    dept_emp d
WHERE
    e.emp_no = d.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no;