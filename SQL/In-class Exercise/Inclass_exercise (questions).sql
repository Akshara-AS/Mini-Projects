#Q1. Print product, price, sum of quantity more than 5 sold during all three months.  


#Q2.Print product, quantity , month and count of records for which estimated_sale_price is less than purchase_cost

#Q3. Extarct the 3rd highest value of column Estimated_sale_price from bank_inventory_pricing dataset

#Q4. Count all duplicate values of column Product from table bank_inventory_pricing

#Q5. Create a view 'bank_details' for the product 'PayPoints' and Quantity is greater than 2 

#Q6 Update view bank_details1 and add new record in bank_details1.
-- --example(Producct=PayPoints, Quantity=3, Price=410.67)

#Q7.Real Profit = revenue - cost  Find for which products, branch level real profit is more than the estimated_profit in Bank_branch_PL.

#Q8.Find the least calculated profit earned during all 3 periods

#Q9. In Bank_Inventory_pricing, 
-- a) convert Quantity data type from numeric to character 
-- b) Add then, add zeros before the Quantity field.  

#Q10. Write a MySQL Query to print first_name , last_name of the titanic_ds whose first_name Contains ‘U’

#Q11.Reduce 30% of the cost for all the products and print the products whose  calculated profit at branch is exceeding estimated_profit .

#Q12.Write a MySQL query to print the observations from the Bank_Inventory_pricing table excluding the values “BusiCard” And “SuperSave” from the column Product

#Q13. Extract all the columns from Bank_Inventory_pricing where price between 220 and 300

#Q14. Display all the non duplicate fields in the Product form Bank_Inventory_pricing table and display first 5 records.

#Q15.Update price column of Bank_Inventory_pricing with an increase of 15%  when the quantity is more than 3.

#Q16. Show Round off values of the price without displaying decimal scale from Bank_Inventory_pricing

#Q17.Increase the length of Product size by 30 characters from Bank_Inventory_pricing.

#Q18. Add '100' in column price where quantity is greater than 3 and dsiplay that column as 'new_price' 

#Q19. Display all saving account holders have “Add-on Credit Cards" and “Credit cards" 

#Q20.
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  transaction amount of accounts appeared  in another column.

#Q21.Display all type of “Credit cards”  accounts including linked “Add-on Credit Cards" 
# type accounts with their respective aggregate sum of transaction amount. 
# Ref: Check linking relationship in bank_transaction_relationship_details.
# Check transaction_amount in bank_account_transaction. 

#Q22. Compare the aggregate transaction amount of current month versus aggregate transaction with previous months.
# Display account_number, transaction_amount , 
-- sum of current month transaction amount ,
-- current month transaction date , 
-- sum of previous month transaction amount , 
-- previous month transaction date.

#Q23.Display individual accounts absolute transaction of every next  month is greater than the previous months .

#Q24. Find the no. of transactions of credit cards including add-on Credit Cards
    
#Q25.From employee_details retrieve only employee_id , first_name ,last_name phone_number ,salary, job_id where department_name is Contracting (Note
#Department_id of employee_details table must be other than the list within IN operator.
    
#Q26. Display savings accounts and its corresponding Recurring deposits transactions are more than 4 times.

#Q27. From employee_details fetch only employee_id, ,first_name, last_name , phone_number ,email, job_id where job_id should not be IT_PROG.

#Q29.From employee_details retrieve only employee_id , first_name ,last_name phone_number ,salary, job_id where manager_id is '60' (Note
#Department_id of employee_details table must be other than the list within IN operator.

#Q30.Create a new table as emp_dept and insert the result obtained after performing inner join on the two tables employee_details and department_details.
