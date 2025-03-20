PROC IMPORT out=sales DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx;
RUN;

/* Report Breakdown */
proc tabulate data=sales;
class province;
var sales shipping_cost;
table province, sales shipping_cost;
RUN;

proc tabulate data=sales;
class province;
var sales shipping_cost;
table province, N (sales shipping_cost) * (N sum mean);
RUN;

/* Subtotals */
proc tabulate data=sales;
class province ship_mode;
var sales shipping_cost;
table province*(all ship_mode) all, N sales*(sum mean) shipping_cost*(sum max min);
RUN;

/* Creating multiple tables */
proc tabulate data=sales;
class ship_mode product_container;
var shipping_cost;
table ship_mode, product_container*shipping_cost*(sum mean);
RUN;

/* If working with data from the same data source, just use one table to print as many tables as you want */
proc tabulate data=sales;
class province ship_mode product_container;
var sales shipping_cost;
table province*(all ship_mode) all, N sales*(sum mean) shipping_cost*(sum max min);
table ship_mode, product_container*shipping_cost*(sum mean);
RUN;
