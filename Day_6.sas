PROC IMPORT datafile="/home/u64157272/commercial rent.xlsx" out=commrent dbms=xlsx;
RUN;

PROC REG data=commrent;
MODEL rental_rates = age operating_expenses vacancy_rates SQfootage;
RUN;
