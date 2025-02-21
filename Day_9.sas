PROC IMPORT DATAFILE="/home/u64157272/customers.xlsx" DBMS=xlsx OUT=customers;
RUN;

PROC IMPORT DATAFILE="/home/u64157272/products.xlsx" DBMS=xlsx OUT=products;
RUN;

PROC IMPORT DATAFILE="/home/u64157272/returns.xlsx" DBMS=xlsx OUT=returns;
RUN;

PROC IMPORT DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx OUT=sales;
RUN;

PROC PRINT DATA=customers;
RUN;

/* Combine Customers and Sales tables */
/* PROC SQL; */
/* CREATE TABLE customer_sales AS */
/* SELECT * */
/* FROM customers */
/* LEFT JOIN sales */
/* ON customers.Customer_Name = sales.Customer_Name */
/* ;QUIT; */

PROC SORT DATA = sales OUT=sorted_data; BY Descending Profit;
RUN;

PROC PRINT DATA = sorted_data (OBS=5);
VAR Customer_Name Profit;
RUN;

/* PROC SQL; */
/* SELECT Customer_Name, Profit */
/* FROM sorted_data */
/* ;QUIT; */
