PROC IMPORT OUT=sales DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx;
RUN;

PROC PRINT DATA=sales;RUN;

DATA test;
SET sales;
type = "default";
RUN;

Data mark_discount;
SET test;
if discount = 0 then type = "Without discount";
else type = "Discounted";
RUN;

/* Concatenation String */
data concat;
name = "John Flake";
newname = name || " Jr";
coolname = "By " || name || " ,we are referring to " || newname;RUN;
