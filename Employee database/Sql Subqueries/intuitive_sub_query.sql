-- assign employee number 110022 as a manager to all the employees from 100001 abd 100020 and employee number 110039 as a manager to all employees from 10021 to 10040

-- SET A >> emp_no 10001 to 10020
-- SET B >> emp_no 10021 to 10040

-- Creating SET A
SELECT 
    *
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110022) AS Manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10001 AND 10020
    GROUP BY e.emp_no) AS A;
    
-- Creating SET B
SELECT 
    *
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Dept_code,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110039) AS Manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no) AS B;

-- query ans

SELECT 
    *
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110022) AS Manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10001 AND 10020
    GROUP BY e.emp_no) AS A 
UNION SELECT 
    *
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Dept_code,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110039) AS Manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no) AS B;
