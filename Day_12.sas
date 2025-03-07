#Baseball dataset
PROC IMPORT DATAFILE = "/home/u64157272/baseball.xlsx" DBMS= xlsx OUT= baseball;
RUN;

PROC MEANS DATA=baseball;RUN;

/* Top 5 home runs */
PROC SORT DATA=baseball out=sorted_data; BY DESCENDING nHome;RUN;
PROC PRINT DATA=sorted_data (OBS=5);RUN;

/* Top 5 paid players */
PROC SORT DATA=baseball out=sorted_salary; BY DESCENDING Salary;RUN;
PROC PRINT DATA=sorted_salary (OBS=5);RUN;

/* Impact of home runs in salary */
PROC REG DATA = baseball;
MODEL Salary = nhome;
RUN;

/* Model above is overfitting due to high t value, lets add other explanatory variables */
PROC REG DATA = baseball;
MODEL Salary = nhome nHits nRuns nAtBat nRBI nBB nOuts nError;
RUN;
