FILENAME car '/folders/myfolders/car final project-new.txt';

DATA DataSet;
 	TITLE = 'PART A';
	INFILE car firstobs = 2; 
	INPUT car $1-32 Weight Disp Mileage Fuel Type $;    
RUN;


/* Part A */
PROC GLM data = DataSet;
	Class Type;
    MODEL Mileage = weight Disp Fuel Type;
    OUTPUT out = outdata r = resid p = yhat;  
	MEANS Type;
RUN;


/* Part B */
DATA Dataset2;
 	TITLE = 'PART B';
	SET DataSet;
	DROP TYPE;
RUN;

PROC REG data = Dataset2;
    MODEL Mileage = Weight Disp Fuel/SELECTION = backward;
    OUTPUT out = newdata r = resid p = yhat;  
RUN;


