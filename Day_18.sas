/* Split String  */
PROC IMPORT OUT = sales DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx;RUN;

PROC PRINT DATA=sales;RUN;

data separater;
set sales;
firstname = scan(Customer_Name, 1, " ");
lastname = scan(Customer_Name, 2, " ");
keep Customer_Name firstname lastname;
RUN;

/* Numerical Formats */
data sample;
number = 3500.679;
RUN;

data fmt;
set sample;
format number 7.2;
fmt1 = put(number, dollar9.2);
fmt2 = put(number, comma8.2);
RUN;

/* Date Formats */
data displaydate;
reportdate = "31Oct2018"d;
date1 = put(reportdate, yymmddn8.);
date2 = put(reportdate, date9.);
RUN;
