PROC IMPORT OUT=sales_one DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx;RUN;

PROC PRINT DATA=sales_one;RUN;

/* 1 Dimension */
PROC TABULATE data=sales_one;
CLASS Province;
TABLE Province;
RUN;

/* 2 Dimension */
PROC TABULATE data=sales_one;
CLASS province;
VAR Sales;
TABLE province,Sales;
RUN;

/* 3 Dimension */
PROC TABULATE data=sales_one;
CLASS Province Ship_Mode;
VAR Sales;
TABLE Ship_Mode, Province, Sales;
RUN;
