FILENAME oilCosts '/folders/myfolders/oil costs hw4.txt';

DATA DataSet;
	INFILE oilCosts firstobs = 5; 
	INPUT Date Domestic Imported Composite ;
    TITLE = 'Oil Cost';     
RUN;


/* Part A */
/* We do not reject the null hypothesis */
PROC MEANS Data = DataSet N MEAN STD T PRT; 
	VAR Domestic;
RUN; 


/* Part B */
/* We do not reject the null hypothesis */
PROC MEANS Data = DataSet N MEAN STD T PRT; 
	VAR Imported;
RUN; 


/* Part C */
/* We do not reject the null hypothesis */
PROC ttest data=DataSet sides=2 alpha=0.05;
	paired Imported*Domestic;
RUN;



FILENAME Cost '/folders/myfolders/oil costs hw4 part 2.txt';

DATA DataSet2;
	INFILE Cost; 
	INPUT Cost Id;     
RUN;


/* Part D */
PROC TTEST DATA = DataSet2;
      CLASS Id;
      VAR Cost;
RUN;

/* Part E */
PROC ANOVA Data=dataset2;
	CLASS Id;
	Model cost = Id;
RUN;
