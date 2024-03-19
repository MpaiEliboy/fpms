CREATE DATABASE financial_portfolio;
USE financial_portfolio;

CREATE TABLE clients (
client_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
contact_info VARCHAR(255)
);


CREATE TABLE portfolios (
portfolio_id INT PRIMARY KEY AUTO_INCREMENT,
client_idp INT,
portfolio_name VARCHAR(100) NOT NULL,
other_details VARCHAR(255),
FOREIGN KEY (client_idp) REFERENCES clients(client_id)
);

CREATE TABLE investments (
investment_id INT PRIMARY KEY AUTO_INCREMENT,
portfolio_id INT,
investment_type VARCHAR(100) NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
investment_date DATE,
other_details VARCHAR(255),
FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    investment_id INT,
    return_percentage DECIMAL(5 , 2 ) NOT NULL,
    return_amount DECIMAL(10 , 2 ) NOT NULL,
    return_date DATE,
    other_details VARCHAR(255),
    FOREIGN KEY (investment_id) REFERENCES investments (investment_id)
);



-- Inserting data into 'clients' table
INSERT INTO clients (name, contact_info)
VALUES ('Harsh Agarwal', '+9876543210');


INSERT INTO portfolios (client_idp, portfolio_name, other_details)
VALUES (@client_idp, 'My Portfolio', 'Long-term investments');


-- Inserting data into 'investments' table
INSERT INTO investments (portfolio_id, investment_type, amount,investment_date, other_details)
VALUES (@portfolio_id, 'Equity', 50000, '2021-01-01', 'Stocks');


-- Inserting data into 'returns' table
INSERT INTO returns (investment_id, return_percentage, return_amount,return_date, other_details)
VALUES (@investment_id, 10.2, 10000, '2021-04-01', 'Returns for Q1 2021');



-- SELECT @investment_id := LAST_INSERT_ID();

-- ALTER TABLE returns AUTO_INCREMENT = 1;

-- select * from returns;

-- delete from returns
-- where return_id in (1,2,4,3,NULL);

-- drop database financial_portfolio;
-- drop table portfolios;