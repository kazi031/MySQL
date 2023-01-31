-- update query

UPDATE employees 
SET 
    birth_date = '1978-01-01',
    first_name = 'Stella',
    last_name = 'Perkinson',
    gender = 'F',
    hire_date = '1992-01-01'
WHERE
    emp_no = 999903;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

-- commit and rollback

SELECT 
    *
FROM
    dup_departments;
 
commit;
 
UPDATE dup_departments 
SET 
    dept_name = 'Data analysis',
    dept_no = 'd011';
-- this was an error to go back to where the task was finished the rollback command is used

rollback;

SELECT 
    *
FROM
    dup_departments;
    
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    
commit;
SELECT 
    *
FROM
    departments;

