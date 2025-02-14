/* Creating a column */
PROC IMPORT out=rent datafile="/home/u64157272/rent.xlsx" dbms=xlsx;
RUN;

data standard;
set rent;
rent_standard = 25000;
run;

data difference;
set standard;
rent_difference = rent - rent_standard;
RUN;

/* Remove Columns */
Data kep;
SET rent;
Keep year;
RUN;

/* If/Else conditions */
Data filter;
set rent;
if year > 2000;
RUN;

/* Sort SAS Data */
