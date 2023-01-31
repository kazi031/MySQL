# how many people have been hired after 1st of january 2000?

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
CREATE INDEX i_hire_date ON employees(hire_date);
# NOW THE SEARCH WILL BE FASTER THAN BEFORE

DROP INDEX i_hire_date ON employees;
DROP INDEX i_salary ON salaries;

CREATE INDEX i_salary ON salaries(salary);

SELECT 
    *
FROM
    salaries
WHERE
   salary > 89000;
