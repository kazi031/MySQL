SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT DISTINCT
    first_name
FROM
    employees;
    
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;



SELECT 
    salary, COUNT(salary) emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;


select to_char(process_date,'DD-MON-YY') from recycle 

select to_char(process_date,'dd/mm/yy'),material_code,sum(material_amount) from recycle group by material_code,to_char(process_date,'dd/mm/yy') 