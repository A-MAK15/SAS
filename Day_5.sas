/* Descriptive statistics */
PROC IMPORT out=rent Datafile="/home/u64157272/rent.xlsx" dbms=xlsx;
RUN;

PROC IMPORT out=crent Datafile="/home/u64157272/crent.xlsx" dbms=xlsx;
RUN;

PROC MEANS data=rent;
VAR rent;
RUN;

PROC MEANS data=rent MEAN MEDIAN STD P5 P95 MIN MAX;
VAR rent;
RUN;

/* Correlation */

PROC CORR data=crent;
VAR age rental_rates;
RUN;
/* 
REGRESSION MODEL */
PROC IMPORT datafile="/home/u64157272/commercial rent.xlsx" dbms=xlsx out=commrent;
RUN;

PROC REG data=commrent;
MODEL rental_rates=age;
OUTPUT out=res RESIDUAL=resid Predicted=pred;
RUN;

PROC print DATA=res;
RUN;
