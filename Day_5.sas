/* Descriptive statistics */
PROC IMPORT out=rent Datafile="/home/u64157272/rent.xlsx" dbms=xlsx;
RUN;

PROC IMPORT out=crent Datafile="/home/u64157272/crent.xlsx" dbms=xlsx;
RUN;

PROC MEANS data=rent;
VAR rent;
RUN;

PROC MEANS data=rent MEAN MEDIAN STD P5 P95 MIN MAX;
VAR rent;
RUN;
