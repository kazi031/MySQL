SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
        


SELECT 
    *
FROM
    employees,
    salaries
WHERE
    employees.emp_no = salaries.emp_no
        AND salaries.salary >= 150000;
        
        
SELECT DISTINCT
    hire_date
FROM
    employees;