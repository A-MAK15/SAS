PROC IMPORT Datafile="/home/u64157272/sales.xlsx" dbms=xlsx out=sales_new_data;
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

/* Sort the data first before you group by province */
proc sort data=sales_new_data; by province; run;

/* Revenue Prediction Project */
PROC IMPORT Datafile="/home/u64157272/sales.xlsx" dbms=xlsx out=sales_new_data;
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

PROC PRINT Data=sales_new_data noobs;run;

proc sort data=sales_new_data out=sorted_data; by province; run;

/*Top 5 golden custormers*/

PROC SORT DATA= sales_new_data; by descending profit;run;

PROC Print Data=sales_new_data (obs=5) noobs; 
var Customer_Name Profit;
run;

/*Top 5 golden customers*/


/* Best product sellers and their profit */

PROC PRINT DATA= sales_new_data; by descending profit;run;

PROC PRINT Data=sales_new_data (obs=5) noobs;
var Product_Name Profit;
run;

/* Best product sellers and their profit */


/* Region distributions */
PROC PRINT DATA=sales_new_data (obs=5) noobs;
var Province Profit;
run;

PROC SORT DATA = sales_new_data;run;

PROC GCHART data=sales_new_data;
pie Profit;
by Province;
run;



