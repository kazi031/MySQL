SELECT 
    first_name, COUNT(first_name) as name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
    emp_no, COUNT(from_date)
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
