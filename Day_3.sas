PROC IMPORT out=rent datafile="/home/u64157272/rent.xlsx" dbms=xlsx;
RUN;

data standard;
set rent;
rent_standard = 25000;
run;
