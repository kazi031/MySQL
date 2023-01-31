drop table if exists emp_manager;

CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

-- SET A emp_no 10001 to 10020 assign manager 110022
insert into emp_manager
select U.* from 
(SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110022) AS manager_no
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
        e.emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110039) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no) AS B 
UNION SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110022) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS C 
UNION SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110039) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS D) as U;
    
    
    -- check
    
    SELECT 
    *
FROM
    emp_manager
ORDER BY emp_no DESC;