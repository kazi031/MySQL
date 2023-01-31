CREATE TABLE items (
    item_id    VARCHAR(100) NOT NULL,
    item       VARCHAR(100) DEFAULT NULL,
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(100),
    PRIMARY KEY (item_id),
    FOREIGN KEY (company_id)
        REFERENCES companies (company_id)
        ON DELETE CASCADE
);
CREATE TABLE sales (
    purchase_number     INT NOT NULL AUTO_INCREMENT,
    date_of_purchase    DATE NOT NULL,
    customer_id         INT DEFAULT NULL,
    item_code VARCHAR(100) NOT NULL,
    PRIMARY KEY (purchase_number)
);
alter table sales
add foreign key(customer_id) references customers(customer_id) on delete cascade,
add foreign key(item_code) references items(item_id) on delete cascade;





