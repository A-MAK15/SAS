/* Excel import */
proc import out=rent DBMS=xlsx DATAFILE="/home/u64157272/rent.xlsx";
sheet="rentdata";
getnames=yes;
RUN;


