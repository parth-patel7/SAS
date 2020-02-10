FILENAME tennis '/folders/myfolders/tennisforhw2.dat';


/* Part 1 */  
DATA tennis;
     INFILE tennis firstobs=3;
     INPUT name $1-21 matches wins losses bagels_served bagels_eaten male;
     
RUN;

PROC PRINT DATA=tennis;
RUN;



/* Part 2 */
DATA tennis1;
	SET tennis;
	Keep name matches wins losses male;
RUN;

PROC PRINT DATA = tennis1;
RUN;



/* Part 3 */
DATA tennis2;
	SET tennis;
	pct = wins/matches;
	if male = 1 THEN tour = 'ATP';
	if male = 0 THEN tour = 'WTP';
	
RUN;

PROC PRINT DATA = tennis2;
RUN;



/* Part 4 */
PROC SORT DATA = tennis2 OUT = tennis3;
     BY DESCENDING pct;
Run;

PROC PRINT DATA=tennis3;
Run;



/* Part 5 */
DATA atpdata wtadata;
	SET tennis3;
	if male = 1 then OUTPUT atpdata;
	else OUTPUT wtadata;
RUN;

PROC PRINT DATA=atpdata;
Run;

PROC PRINT DATA=wtadata;
Run;	
	
	

/* Part 6 */
FILENAME dataout '~/atp_rankings.txt';
DATA temp;
	Set atpdata;
	file dataout;
	put name pct;
RUN;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
