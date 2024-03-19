insert into clients (name,contact_info)
values ('Ananya Sharma', '+91 8765432109'),
('Amit Kumar', '+91 7654321098'),
('Priya Sharma', '+91 6543210987'),
('Rahul Singh', '+91 5432109876'),
('Sneha Patel', '+91 4321098765'),
('Mohit Gupta', '+91 3210987654'),
('Anjali Verma', '+91 2109876543'),
('Vikas Dubey', '+91 1098765432'),
('Nisha Singh', '+91 0987654321');

insert into portfolios (client_idp,portfolio_name,other_details)
values (2, 'Equity Portfolio', 'Long-term investments'),
(3, 'Commodity Portfolio', 'Diversified investments'),
(4, 'Equity Portfolio', 'Long-term investments'),
(4, 'Real Estate Portfolio', 'Property investments'),
(5, 'Debt Portfolio', 'Short-term investments'),
(6, 'Equity Portfolio', 'Long-term investments'),
(7, 'Debt Portfolio', 'Short-term investments'),
(8, 'Commodity Portfolio', 'Diversified investments'),
(9, 'Equity Portfolio', 'Long-term investments'),
(10, 'Debt Portfolio', 'Short-term investments');

insert into investments (portfolio_id,investment_type,amount,investment_date,other_details)
values (2, 'Equity', 75000.00, '2021-12-31', 'Long-term investment'),
(3, 'Commodity', 25000.00, '2021-11-15', 'Diversified investment'),
(4, 'Equity', 200000.00, '2022-03-01', 'Long-term investment'),
(4, 'Real Estate', 5000000.00, '2021-10-20', 'Property investment'),
(5, 'Debt', 100000.00, '2021-09-01', 'Short-term investment'),
(6, 'Equity', 500000.00, '2021-08-15', 'Long-term investment'),
(7, 'Debt', 75000.00, '2022-02-28', 'Short-term investment'),
(8, 'Commodity', 100000.00, '2022-03-10', 'Diversified investment'),
(9, 'Equity', 150000.00, '2022-01-20', 'Long-term investment'),
(10, 'Debt', 30000.00, '2021-11-30', 'Short-term investment');


INSERT INTO returns (investment_id, return_percentage, return_amount,return_date, other_details)
VALUES
(2, 8.50, 4250.00, '2022-04-01', 'Quarterly returns'),
(3, 7.00, 1750.00, '2022-03-01', 'Monthly returns'),
(4, 12.75, 25500.00, '2022-06-01', 'Quarterly returns'),
(4, 10.00, 500000.00, '2022-01-01', 'Yearly returns'),
(5, 6.25, 6250.00, '2022-05-15', 'Quarterly returns'),
(6, 9.75, 4875.00, '2022-03-15', 'Quarterly returns'),
(7, 5.50, 4125.00, '2022-06-15', 'Quarterly returns'),
(8, 4.00, 4000.00, '2022-02-15', 'Monthly returns'),
(9, 11.25, 16875.00, '2022-05-20', 'Quarterly returns'),
(10, 6.00, 1800.00, '2022-04-30', 'Monthly returns');

select * from returns;