CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(100),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);
CREATE TABLE items (
    item_code VARCHAR(10) NOT NULL,
    item VARCHAR(100) DEFAULT NULL,
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(100),
    PRIMARY KEY (item_code)
);
CREATE TABLE companies (
    company_id VARCHAR(100),
    company_name VARCHAR(100),
    headquaters_phone_number INT(12),
    PRIMARY KEY (company_id)
);



















