-- show the employee_numbers of the 10 highest paid employees in the database
SELECT 
    emp_no, salary
FROM
    salaries
ORDER BY salary DESC 
LIMIT 10;

-- Select the first 100 rows from the ‘dept_emp’ table. 

SELECT 
    *
FROM
    dept_emp
LIMIT 100;