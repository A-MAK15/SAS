PROC IMPORT OUT=sales DATAFILE="/home/u64157272/sales.xlsx" DBMS=xlsx;
RUN;

PROC PRINT DATA=sales;RUN;

DATA test;
SET sales;
type = "default";
RUN;

Data mark_discount;
SET test;
if discount = 0 then type = "Without discount";
else type = "Discounted";
RUN;

/* Concatenation String */
data concat;
name = "John Flake";
newname = name || " Jr";
coolname = "By " || name || " ,we are referring to " || newname;RUN;

/* CAT, CATS, CATX */
data cat;
length cat $ 80 cats $ 80 catx $ 80;
x = "Rio is t    ";
y = " he Olym";
z = " pic site for 2016.";
cat = cat(x, y, z);
cats = cats(x, y, z);
catx = catx("_____", x, y, z);
RUN;

/* LEFT and RIGHT Alignment */
data sample;
input name $char14.;
datalines;
Joe Smith
Roma Brown
Alice Wonderland
Li Wang
;RUN;

data toleft;
set sample;
left = left(name);
right = right(name);
RUN;

