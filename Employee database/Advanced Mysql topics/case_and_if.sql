
SELECT 
    e.*, dm.*
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
-- only the managers right side columns will be filled not the other employees

-- use of case
-- For case we can use multiple conditional expression but in if we can only use 1
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees
LIMIT 100;
-- uisng if

SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;

-- Check if a employee is manager or not

SELECT 
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NULL THEN 'Employee'
        ELSE 'Manager'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.emp_no > 109990;
    
    
-- increase of the salary of all department manager
SELECT 
    dm.emp_no,
    dm.dept_no,
    CASE
        WHEN MAX(salary) - MIN(salary) > 30000 THEN 'raise > 30000'
        WHEN MAX(salary) - MIN(salary) BETWEEN 20000 AND 30000 THEN '20000 < raise < 30000'
        ELSE 'raise < 20000'
    END as raise
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no;

-- ----------------------------------------------------------------------------
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
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
