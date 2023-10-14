# 1 . extract all the employees name start with A and ends with A 

select * from employee_details where E_name like "A%A";

# 2 . find common names from employee_details name and customer name

SELECT CUSTOMER.C_NAME,EMPLOYEE_DETAILS.E_NAME
FROM CUSTOMER,EMPLOYEE_DETAILS
WHERE CUSTOMER.C_NAME = EMPLOYEE_DETAILS.E_NAME;

# 3. create a view payment not done of those customers who have not paid the amount

create view payment_not_done as select C_name, payment_status 
from payment_details as pay,customer as cust 
where pay.c_id = cust.c_id and payment_status = 'NOT PAID';

# 4. find the frequency(in %) in each of the class of payment mode
select * from payment_details;
select payment_mode, (count(payment_mode)*.5) as frequency from payment_details group by payment_mode;

# 5. create a column total payable charges using shipping cost & price of the product

ALTER TABLE payment_details
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
