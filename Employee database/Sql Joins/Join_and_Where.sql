-- Select the first and last name, the hire date,the job title of all employees and departments whose first name is “Margareta” and have the last name “Markovitch”.

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
GROUP BY e.emp_no;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title, d.dept_no,d1.dept_name
FROM
    titles t
        JOIN
    employees e
        JOIN
    dept_emp d
        JOIN
    departments d1 ON t.emp_no = e.emp_no
        AND e.emp_no = d.emp_no
        AND d.dept_no = d1.dept_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
GROUP BY e.emp_no;