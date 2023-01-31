-- Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    titles t ON dm.emp_no = t.emp_no
        AND dm.from_date = t.from_date
        JOIN
    employees e ON e.emp_no = t.emp_no
ORDER BY e.emp_no; 
    
    commit;
