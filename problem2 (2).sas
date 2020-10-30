FILENAME car '/folders/myfolders/car final project-new.txt';


/*  The COMPARE procedure compares the contents of two datasets (DataSet1 and DataSet2). 
	It can also compare selected variables in different data sets, or variables within the same data set */

DATA DataSet1;
	INFILE car firstobs = 2 obs=61; 
	INPUT car $1-32 Weight Disp Mileage Fuel Type $;     
RUN;



DATA DataSet2;
	INFILE car firstobs = 31; 
	INPUT car $1-32 Weight Disp Mileage Fuel Type $;     
RUN;


PROC compare base= DataSet1
	compare = DataSet2;
RUN;
