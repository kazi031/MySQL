SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
  DATE_FORMAT(hire_date, '%d-%m-%Y') LIKE ('%2000');
  
SELECT 
    DATE_FORMAT(hire_date, '%d-%m-%Y')
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');