CREATE TABLE companies (
    company_id VARCHAR(100),
    company_name VARCHAR(100),
    headquaters_phone_number INT(12),
    PRIMARY KEY (company_id)
);

alter table companies
add unique key(company_name),
add unique key(headquaters_phone_number);

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(100),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

alter table customers
add unique key(email_address);

alter table customers
add column gender enum('M','F') after last_name;

insert into customers (first_name,last_name,gender,email_address,number_of_complaints) values('Kazi Rafid','Raiyan','M','Kazirafidraiyan031@gmail.com',1);
select * from sales.customers;
insert into customers (first_name,last_name,gender,email_address,number_of_complaints) values('Asima Oshin','Putul','F','Asima.oshin1998@gmai.com',2);


alter table customers
change column number_of_complaints number_of_complaints int default 0;

insert into customers (first_name,last_name,gender) values('MM Rushadul','Mannan','M');

select * from customers;

