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



/* Compress Functions */
data names;
input name $char20.;
datalines;
Joe Smith
  Rome  Smith
  Alice Wonderland
  Li    Wang
;RUN;

data sample;
set names;
compress = compress(name);
compbl = compbl(name);
RUN;

data zip;
set sashelp.zipcode;
RUN;

data zip2;
set zip;
ac = compress(areacode, '/97'); /* /97 will be removed in the areacode column */
RUN;

