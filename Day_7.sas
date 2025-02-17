/* Regression Review */
PROC IMPORT datafile="/home/u64157272/commercial rent.xlsx" out=commrent dbms=xlsx;
RUN;

PROC REG data=commrent;
MODEL rental_rates = age operating_expenses SQfootage;
/* Vacancy : TEST vacancy_rates = 0;  */
RUN;

PROC IMPORT datafile="/home/u64157272/commercial rent.xlsx" out=commrent dbms=xlsx;
RUN;

/* Series Plot */
PROC SORT DATA = commrent;
BY SQfootage;
RUN;

PROC GPLOT DATA = commrent;
SYMBOL INTERPOL=join VALUE=dot H=1;
PLOT vacancy_rates * SQfootage;
RUN;

/* Bar plot */
proc gchart data = commrent;
vbar age / discrete;
run;

proc gchart data = commrent;
hbar age / discrete;
run;

/* Pie chart */
proc gchart data = commrent;
pie age / discrete;
run;

/* Multiple plots */
proc sort data = commrent;
by age;
run;

legend1 label = ("plot legend")
		shape = symbol
		position = (top center inside);

proc gplot data = commrent;
symbol interpol = join value=dot height = 1;
plot vacancy_rates*age operating_expenses*age / overlay legend = legend1;
run;
