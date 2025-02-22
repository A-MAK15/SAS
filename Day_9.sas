PROC IMPORT DATAFILE="/home/u64157272/customers.xlsx" DBMS=xlsx OUT=customers;
RUN;

PROC IMPORT DATAFILE="/home/u64157272/products.xlsx" DBMS=xlsx OUT=products;
RUN;

PROC IMPORT DATAFILE="/home/u64157272/returns.xlsx" DBMS=xlsx OUT=returns;
RUN;

PROC IMPORT DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx OUT=sales;
RUN;

PROC PRINT DATA=sales;
RUN;

PROC SQL;
CREATE TABLE merged_data AS
SELECT a.*, b.*, c.*
FROM sales as a
LEFT JOIN customers as b 
ON a.customer_id = b.id
LEFT JOIN products as c
ON a.product_id = c.id
;QUIT;


/* Top 5 golden customers */
PROC PRINT DATA = merged_data;
RUN;

PROC SQL;
CREATE TABLE per_customer AS
SELECT customer_name, sum(profit) AS profit
FROM merged_data
GROUP BY customer_name
ORDER BY profit descending
;QUIT;

PROC PRINT DATA = per_customer (OBS=5);
RUN;
/* Top 5 golden customers */


/* Best seller product */
PROC SQL;
CREATE TABLE per_product AS
SELECT product_name, sum(profit) AS profit
FROM merged_data
GROUP BY product_name
ORDER by profit descending
;QUIT;

PROC PRINT DATA = per_product (OBS=5);
RUN;
/* Best seller product */


/* Distribution */
PROC SQL;
CREATE TABLE pro_percentage AS
SELECT province, sale, sale / sum(sale)
;QUIT;






