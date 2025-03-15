/* UPCASE, LOWCASE and PROPCASE functions */
data names;
input name $char20.;
datalines;
Joe Smith
ROMA BROWN
Alice Wonderland
Li Wang
;RUN;

data clean;
set names;
upcase = upcase(name);
lowcase = lowcase(upcase);
propcase = propcase(name);
RUN;

/* TRIM Functions */
data names;
input name $char20.;
datalines;
Joe Smith
  Roma   Brown
  Alice  Wonderland
  Li     Wang
  
;RUN;

data clean;
set names;
trim = '*' || trim(name) || '*';
trimn = '*' || trimn(name) || '*';
strip = '*' || strip(name) || '*';
RUN;


