PROC IMPORT datafile="/home/u64157272/commercial rent.xlsx" out=commrent dbms=xlsx;
RUN;

/* Multiple Regression */
PROC REG data=commrent;
MODEL rental_rates = age operating_expenses vacancy_rates SQfootage;
RUN;

/* Prediction */
DATA new;
INPUT rental_rates age operating_expenses vacancy_rates SQfootage;
DATALINES;
. 4 10 0.1 80000
. 6 11.5 0 12000
. 12.0 12.5 0.32 340000
;

DATA combined;
SET commrent new;
RUN;


PROC REG DATA=combined;
MODEL rental_rates = age operating_expenses vacancy_rates SQfootage / CLI;
RUN;
