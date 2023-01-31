-- Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed”
--  if the employee is still working in the company, or “Not an employee anymore” if they aren’t.


SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'current_employee'
        ELSE 'Not an employee anymore'
    END AS employment_status
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 200;