FILENAME cornData '/folders/myfolders/corn.txt';

DATA CornSet;
     INFILE cornData;
     INPUT year yield rain;
RUN;


DATA CornSet2;
	SET cornset;
	IF yield < 32 THEN catyield = 'poor';
	IF yield >= 32 THEN catyield = 'good';

	IF rain < = 9.7 THEN catrain = 'drought';
	IF 9.7 < rain < = 12 THEN catrain = 'normal';
	IF rain >12 THEN catrain = 'wet';
RUN;



PROC PRINT DATA=cornset2;
RUN;

/* Part 1 */
PROC FREQ DATA = cornset2;
	TABLES catyield catrain;
RUN;
 
/* Explaination: The Freq command gives information about frequency for catyield
and catrain, catyeild has 12 "good" and 7 "poor" observations while for catrain "drought" 
has 9, "normal" has 7 and "wet" has 3 observations. All this information 
can be further used to analyze about rain and its effects on yeild*/




/* Part 2 */
PROC FREQ data = cornset2;
	TABLES catyield*catrain;
RUN;
/* Explaination: This code generates two way table which gives information about catrain and
its effects on catyeild, There are 4 observations where there is drought but still the yeild is good
and 1 observation where the rain is wet but still the yeild is poor. This way we can analyze this two way
table in much more details and use it to predict different things */

