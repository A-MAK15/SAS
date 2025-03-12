/* Dates */
data test;
today_date = today();
RUN;

proc print data = test;run;

data test;
set test;
format today_date date9.;
run;

proc print data=test;

data test;
birthday = '15Oct2011';
temp = birthday - 1;
run;

data test2;
set test;
dbirth = input(birthday, date9.);
format dbirth date9.;
run;
