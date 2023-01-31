select * from companies;
#if you want to drop a table with foreign key constraint you have to drop the foreign key first
/*
comment 1 
comment 2
comment 3
*/
alter table items drop foreign key items_ibfk_1;
drop table companies;

alter table items
change column company_id company_id int not null;

alter table companies
change column company_id company_id int not null auto_increment;


alter table companies 
change column company_name company_name varchar(100) not null;

alter table companies
modify company_name varchar(100) null;

alter table companies
change column headquaters_phone_number headquaters_phone_number varchar(30);

insert into companies(company_name,headquaters_phone_number) values('Company A','+8801914204310');


select * from companies;
