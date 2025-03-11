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
