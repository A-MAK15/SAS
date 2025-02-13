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

/* Enter data within program */
data sample;
input height weight name $;
datalines;
170 300 Joe
131 192 Alice
231 421 Roma
;
/* run; */
proc print data=sample;run;
