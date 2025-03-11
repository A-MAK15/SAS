PROC IMPORT DATAFILE="/home/u64157272/cars.xlsx" DBMS=xlsx OUT=cars;
RUN;

/* Determinants of Horsepower */
PROC REG DATA=cars;
MODEL Horsepower = Cylinders / VIF;
RUN;

/* Determinants of MPG */
PROC REG DATA=cars;
MODEL MPG_city = cylinders weight wheelbase length / VIF;
RUN;

/* Determinants of Price */
PROC REG DATA=cars;
MODEL MSRP = horsepower MPG_City / VIF;
RUN;

/* Brand premium */
PROC GLM DATA = cars;
CLASS make;
MODEL MSRP = horsepower MPG_City make / noint solution;
RUN;



/* Stock Market */
PROC IMPORT DATAFILE="/home/u64157272/sp500.csv" DBMS="csv" OUT=sp;
RUN;

PROC SORT DATA=sp; BY date; RUN;

DATA measures;
SET sp;
ret = (adj_close - lag(adj_close)) / lag (adj_close);
invol = (high - low) / adj_close;
RUN;

DATA mark;
SET measures;
ann = 0;
eff = 0;
if "05Nov2016"d <= date and date <= "13Nov2016"d then ann=1;
if "17Jan2017"d <= date and date <= "25Jan2017"d then eff=1;
RUN;

PROC SQL;
CREATE TABLE RETURN as 
SELECT *, ret - AVG(ret) as aret
FROM mark
;QUIT;

PROC PRINT DATA = RETURN (OBS=100);RUN;

PROC REG data = RETURN;
model aret = ann eff;
run;


