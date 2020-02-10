DATA One;
	INPUT ID age name $; DATALINES;
1001 21 Jone
1002 20 Peter
1003 22 Mary
1004 19 Joe
1005 21 Mark
1006 23 Sue
1007 19 Harry
1008 18 Tom
1009 22 Andy
1020 21 Larry
;
RUN;

PROC PRINT DATA=One; 
RUN;


DATA Two;
	INPUT ID gender $ department $; DATALINES;
1006 F Econ
1007 M Econ 
1008 M Math 
1009 M Stat 
1010 M Stat 
1001 M Econ 
1002 M Stat 
1003 F Econ 
1004 F Econ 
1005 M Fina 
;
RUN;
PROC PRINT DATA=Two; RUN;



/* Part 1 */
/* Concatenating */
DATA Combine1;
	SET one two;
RUN;

PROC PRINT DATA = combine1;
RUN;


/* One-to-one merge */
DATA Combine2;
	MERGE one two;
RUN;

PROC PRINT DATA = combine2;
RUN;



/* Part 2 */
/* Interleaving */
PROC SORT DATA = One OUT = oneSorted;
     BY ID;
Run;
PROC SORT DATA = Two OUT = twoSorted;
     BY ID;
Run;

DATA Combine3;
	SET oneSorted twoSorted;
RUN;

PROC PRINT DATA = combine3;
RUN;

/* Match Merge */
DATA combined4;
     MERGE oneSorted twoSorted;
     BY ID;
RUN;
PROC PRINT DATA = combined4;
RUN;



/* Part 3 */
DATA Combine5;
	SET oneSorted twoSorted;
RUN;

PROC PRINT DATA = combine5;
RUN;
*/ The difference when we do the Concatenating again with sorted data sets is that the 
   new data set that is formed has each data set sorted unlike the 1) where both data sets after merging were 
   unsorted */



