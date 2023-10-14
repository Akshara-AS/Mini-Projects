use project; 

# 1. Cust + Member + Payment + Ship + Status

alter table customer change C_ID cust_id int;
alter table customer change M_ID membership_id int;
alter table payment_details change SH_ID shipment_id int;
alter table status change SH_ID ship_id int;
alter table shipment_details change C_ID customer_id int;

CREATE VIEW customer_details
as SELECT *
FROM customer
LEFT JOIN membership
    ON customer.membership_id = membership.M_ID
LEFT JOIN payment_details
    ON customer.cust_id = payment_details.C_ID
LEFT JOIN shipment_details
    ON customer.cust_id = shipment_details.customer_id
    AND payment_details.shipment_id = shipment_details.SH_ID
LEFT JOIN status
    ON shipment_details.SH_ID = status.ship_id
UNION 
SELECT *
FROM customer
RIGHT JOIN membership
    ON customer.membership_id = membership.M_ID
RIGHT JOIN payment_details
    ON customer.cust_id = payment_details.C_ID
RIGHT JOIN shipment_details
    ON customer.cust_id = shipment_details.customer_id
    AND payment_details.shipment_id = shipment_details.SH_ID
RIGHT JOIN status
    ON shipment_details.SH_ID = status.ship_id;
    
select * from customer_details;

# 2 . Emp + Manages + Ship + Status 

CREATE VIEW employee_shipment_details AS
SELECT *
FROM employee_details
LEFT JOIN employee_manages_shipment ON employee_details.E_ID = employee_manages_shipment.Employee_E_ID
LEFT JOIN shipment_details ON employee_manages_shipment.Shipment_Sh_ID = shipment_details.SH_ID
UNION
SELECT *
FROM employee_details
RIGHT JOIN employee_manages_shipment ON employee_details.E_ID = employee_manages_shipment.Employee_E_ID
RIGHT JOIN shipment_details ON employee_manages_shipment.Shipment_Sh_ID = shipment_details.SH_ID;

select * from employee_details;

# 3 . Emp + Manages + Ship + Customer 

CREATE VIEW employee_customer_details AS
SELECT *
FROM employee_details
LEFT JOIN employee_manages_shipment ON employee_details.E_ID = employee_manages_shipment.Employee_E_ID
LEFT JOIN shipment_details ON employee_manages_shipment.Shipment_Sh_ID = shipment_details.SH_ID
LEFT JOIN customer ON shipment_details.customer_id = customer.cust_ID
UNION
SELECT *
FROM employee_details
RIGHT JOIN employee_manages_shipment ON employee_details.E_ID = employee_manages_shipment.Employee_E_ID
RIGHT JOIN shipment_details ON employee_manages_shipment.Shipment_Sh_ID = shipment_details.SH_ID
RIGHT JOIN customer ON shipment_details.customer_id = customer.Cust_ID;

select * from employee_customer_details;


# 1 . extract all the employees name start with A and ends with A 

select * from employee_details where E_name like "A%A";

# 2 . find common names from employee_details name and customer name

select E_name, C_name from employee_customer_details ;

# 3. create a view payment not done of those customers who have not paid the amount

create view payment_not_done as select C_name, payment_status 
from payment_details as pay,customer as cust 
where pay.c_id = cust.cust_id and payment_status = 'NOT PAID';

select * from payment_not_done;

# 4. find the frequency(in %) in each of the class of payment mode
select * from payment_details;
select payment_mode, (count(payment_mode)*.5) as frequency from payment_details group by payment_mode;

# 5. create a column total payable charges using shipping cost & price of the product

ALTER view customer_details
ADD total_payable_charges bigint;

UPDATE payment_details AS t
JOIN shipment_details AS s_details ON t.sh_id = s_details.sh_id
SET t.total_payable_charges = s_details.sh_charges + t.amount;

select payment_details.c_id,payment_details.amount,shipment_details.sh_charges,payment_details.total_payable_charges
from shipment_details,payment_details
where  shipment_details.c_id=payment_details.c_id;




# 6. highest total payable amount

select max(total_payable_charges) from payment_details;


# 7. extract customer id and customer name of customers who were the member of branch more than 10 years

select c_id, c_name, (mem.end_date - mem.start_date) as membership_years 
from customer as cust, membership as mem 
where cust.m_id = mem.m_id and (mem.end_date - mem.start_date) > 10;


# 8. who got the product delivered on the next day the product was sent




# 9 . which shipping content has highest total amount (top 5)

select s.sh_content,sum(p.amount) 
from shipment_details s,payment_details p 
where p.Sh_ID=s.SH_ID 
group by s.sh_content  
order by sum(p.amount) desc 
limit 5;

# 10. which product categories from shipment content are transferred more?

select sh_content, count(*) 
from shipment_details 
group by sh_content 
order by count(sh_content) desc 
limit 1;

