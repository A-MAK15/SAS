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

data test;
today = today();
format today date9.;
yesterday = today - 1;
format yesterday date9.;
tmr = today + 1;
format tmr date9.;
RUN;

data diffdate;
birthday = '11Oct2017'd;
newyear = '01Jan2018'd;
format birthday date9.;
format newyear date9.;
days_to_newyear = newyear - birthday;
run;

data toppriority;
gfbirthday = '05Jan1990'd;
format gfbirthday date9.;
prepare = intnx('month', gfbirthday, -1);
format prepare date9.;
run;
