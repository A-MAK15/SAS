/* Data description */
PROC IMPORT OUT=comp DATAFILE="/home/u64157272/company data.csv" dbms=csv;
GETNAMES=Yes;
RUN;

PROC CONTENTS DATA=comp; RUN;
