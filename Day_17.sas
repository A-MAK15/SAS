/* Index Functions */
data zip;
set sashelp.zipcode;
RUN;

data rio;
set zip;
idx = index(city, "Rio");
if idx > 0;
RUN;

data city;
set zip;
idx = index(upcase(countynm), "R");
if idx > 0;
RUN;

/* Extract Substring */
data test;
set sashelp.zipcode;
RUN;

data test;
set sashelp.zipcode;
idxspace = index(city, " ");
first5 = substr(city, idxspace);
substr(city, 1, idxspace) = "Wakanda";
RUN;
