FILENAME oilCosts '/folders/myfolders/oil costs hw4.txt';


DATA DataSet;
	INFILE oilCosts firstobs = 5; 
	INPUT Date Domestic Imported Composite ;
    TITLE = 'Oil Cost';     
RUN;



/* Part 1 */
PROC PLOT DATA = DataSet;
	PLOT Domestic*Date;
RUN;



/* Part 2 */
PROC PLOT DATA = DataSet;
	PLOT Imported*Date = '%';
RUN;
 


/* Part 3 */
PROC PLOT DATA = DataSet ;
	 PLOTS (Imported Domestic)*Date;
RUN;
