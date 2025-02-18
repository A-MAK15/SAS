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

