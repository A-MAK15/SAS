PROC IMPORT Datafile="/home/u64157272/sales.xlsx" dbms=xlsx out=sales_data;
RUN;

PROC PRINT Data=sales_new_data noobs;
var sales shipping_cost profit;
where shipping_cost > 10;
format profit dollar9.2;
title "Sample of high shipping cost orders";
sum profit sales;
by province;
id province;
run;

PROC PRINT Data=sales_data noobs;run;

proc sort data=sales_data out=sorted_data; by province; run;

/*Top 5 golden customers*/

PROC SORT DATA= sales_data out=sorted_profit; by descending profit;run;

PROC Print Data=sorted_profit (obs=5) noobs; 
var Customer_Name Profit;
run;

/*Top 5 golden customers*/


/* Best product sellers and their profit */

/* PROC SORT DATA= sales_data; by descending profit;run; */

PROC PRINT Data=sorted_profit (obs=5) noobs;
var Product_Name Profit;
run;

/* Best product sellers and their profit */


/* Region distributions */

PROC SORT DATA = sorted_profit; by Sales;run;
PROC SORT DATA = sorted_profit; by Province;run;

PROC GCHART data=sorted_profit;
vbar Sales;
by Province;
run;



