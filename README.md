# fpms
The project manages diverse financial portfolios for clients, constructed entirely using Structured Query Language (SQL)

```SQL
CREATE DATABASE financial_portfolio;
```
```SQL
USE financial_portfolio; 
```
The database [financial_portfolio] comprises four tables:

1. Clients - containing basic client information such as names and contact details.
2. Investments - recording initial investment amounts, investment dates, and types of investments (e.g., fund types).
3. Portfolios - categorizing portfolio types.
4. Returns - tracking investment performance and return dates.

Table relationships are established using primary keys and foreign keys in MySQL.

## Clients table
```SQL
CREATE TABLE clients (
client_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
contact_info VARCHAR(255)
);
```

## Portfolios table
```SQL
CREATE TABLE portfolios (
portfolio_id INT PRIMARY KEY AUTO_INCREMENT,
client_idp INT,
portfolio_name VARCHAR(100) NOT NULL,
other_details VARCHAR(255),
FOREIGN KEY (client_idp) REFERENCES clients(client_id)
);
```
## Investments table
```SQL
CREATE TABLE investments (
investment_id INT PRIMARY KEY AUTO_INCREMENT,
portfolio_id INT,
investment_type VARCHAR(100) NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
investment_date DATE,
other_details VARCHAR(255),
FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id)
);
```

## Return table
```SQL
CREATE TABLE returns (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    investment_id INT,
    return_percentage DECIMAL(5 , 2 ) NOT NULL,
    return_amount DECIMAL(10 , 2 ) NOT NULL,
    return_date DATE,
    other_details VARCHAR(255),
    FOREIGN KEY (investment_id) REFERENCES investments (investment_id)
);
```
