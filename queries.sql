-- names and contacts of clients
select name,contact_info from clients;

-- portfolio names and clients' names
select portfolio_name, name from portfolios
join clients
on portfolios.client_idp =clients.client_id;

-- total sum of investment amount for each portfolio
select portfolio_name, sum(amount) from investments
join portfolios
on investments.portfolio_id = portfolios.portfolio_id
group by portfolio_name;


-- # of investments on specific investment type
select investment_type,count(*) from investments
group by investment_type;


-- average return for each investment type
select round(avg(return_percentage),2), investment_type from returns
Join investments
on  investments.investment_id = returns.investment_id
group by investment_type;
-- ------------------------------------------------ 2 -----------------------------------------------------------------------------
-- Querying Investment amount for each investment type, their corresponding portfolio and client info
select return_amount,investment_type, portfolio_name, name, contact_info from returns
join investments
on returns.investment_id = investments.investment_id
join portfolios
on investments.portfolio_id = portfolios.portfolio_id
join clients
on portfolios.client_idp = clients.client_id;


-- practicing further on aggregate function and group by method | NOT IMPORTANT
select sum(return_amount), name, avg(investments.amount), contact_info from returns
join investments
on returns.investment_id = investments.investment_id
join portfolios
on investments.portfolio_id = portfolios.portfolio_id
join clients
on portfolios.client_idp = clients.client_id
group by name ,contact_info;


-- Top 3 portfolios with highest total investment amount

select sum(i.amount) , p.portfolio_name from portfolios p
join investments i
on p.portfolio_id = i.portfolio_id
group by p.portfolio_name
order by sum(i.amount) desc limit 3;

-- investments made in the last year with their corresponding portfolio and hr clients' name

select  i.investment_type, p.portfolio_name, c.name from investments i
join portfolios p
on p.portfolio_id = i.portfolio_id
join clients c
on c.client_id = p.client_idp
where year(i.investment_date) = 2021;
-- where i.investment_date > date_sub(now() , interval 3 year);

-- CLIENTS' WITH MULTIPLE  PORTFOLIOS
select c.name,count(distinct p.portfolio_name) from clients c
join portfolios p
on p.client_idp = c.client_id 
group by c.name
having count(distinct p.portfolio_name) >=2;

-- portfolios with with total return amount greater than the average return amount
select sum(return_amount), portfolio_name from returns r
join investments
on investments.investment_id = r.investment_id

join portfolios p
on p.portfolio_id = investments.portfolio_id
group by portfolio_name
having sum(return_amount) >(select avg(return_amount)/3 from returns);

-- --------------------------------------- 3 ---------------------------------------------------
-- Retrieve the top 3 clients with the highest total investment amount across all portfolios, along with the corresponding portfolio and investment information

select distinct name, sum(i.amount),  portfolio_name from clients c

join portfolios p
on c.client_id = p.client_idp

join investments i
on p.portfolio_id = i.portfolio_id

group by name,portfolio_name
order by sum(i.amount) desc limit 3;

-- Retrieve the portfolios with the highest average return percentage, along with the corresponding investment and client information

 select portfolio_name, avg(return_percentage), investment_type, name from returns r
join investments i
on r.investment_id = i.investment_id
join portfolios p
on p.portfolio_id = i.portfolio_id
join clients c
on c.client_id = p.client_idp
group by portfolio_name, name,investment_type
order by avg(return_percentage) desc limit 1
;
 
 -- Retrieve the investments that have not yet received any returns.
SELECT return_amount, i.investment_type, i.amount, i.investment_date, p.portfolio_name, c.name
FROM investments i
JOIN portfolios p ON i.portfolio_id = p.portfolio_id
JOIN clients c ON p.client_idp = c.client_id
LEFT JOIN returns r ON i.investment_id = r.investment_id
WHERE r.return_id IS NULL;

-- Retrieve the clients who have investments in all portfolios

select c.name from portfolios p
join  clients c
on p.client_idp = c.client_id
left join investments i
on p.portfolio_id = i.portfolio_id 
group by c.name
having count(distinct p.portfolio_id) = count(distinct i.portfolio_id);

-- ------------------------------------------------------------------------------------------------------------
-- Retrieve the portfolios with the highest total investment amount for each client.

select c.name, sum(i.amount), p.portfolio_name from clients c
join portfolios p on c.client_id = p.client_idp
join investments i on i.portfolio_id = p.portfolio_id
group by c.name,p.portfolio_name
order by sum(i.amount) desc limit 1 ;

select * from returns;