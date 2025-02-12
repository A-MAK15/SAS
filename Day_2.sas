/* Excel import */
proc import out=rent DBMS=xlsx DATAFILE="/home/u64157272/rent.xlsx";
sheet="rentdata";
getnames=yes;
RUN;

/* CSV Import */
DATA proj;
INFILE "/home/u64157272/company data.csv" DSD MISSOVER FIRSTOBS=2;
INPUT Cusip$ fyear name$;
RUN;
