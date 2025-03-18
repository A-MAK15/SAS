PROC IMPORT OUT=heart DATAFILE="/home/u64157272/heart.xlsx" DBMS=xlsx;
RUN;

/* Static Method */
data test;
set heart; 
length smokestatus $ 20.;
if smoking > 0 then smokestatus = "Smoker";
else smokestatus = "Non-Smoker";
RUN;

/* More Reusable Method */
PROC FORMAT;
VALUE smokestatus
		0 = "Non-Smoker"
		other = "Smoker"
		;
RUN;

data test2;
set heart;
format smoking smokestatus.;
RUN;
