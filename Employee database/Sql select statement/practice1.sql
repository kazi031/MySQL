SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (last_name = 'Kellie'
        OR last_name = 'Aruna');