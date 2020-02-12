FILENAME wineData '/folders/myfolders/wine.data';


/* Part 1 */
DATA DataSet;
     INFILE wineData DELIMITER = ',';
    
     INPUT ide alco mal ash alc mag tot fla non pro col hue od2 pro;
     
     LABEL ide = "identifier" alco = "Alcohol" mal = "Malic acid" ash = "Ash"
     alc = "Alcalinity of ash" mag = "Magnesium" tot = "Total phenols" 
     fla = "Flavanoids" non = "Nonflavanoid phenols" pro = "Proanthocyanins" 
     col = "Color intensity" hue = "Hue" od2 = "OD280/OD315 of diluted wines" pro = "Proline";
     
     /* Part 2 */
     TITLE = 'Wine Summary Data';
     
RUN;


/* Part 3 */
PROC MEANS Data = DataSet;
RUN;


/* Part 4 */
PROC UNIVARIATE DATA = DataSet Normal PLOT; 
	BY ide;
	VAR mal;
RUN;


/* Part 5 */
PROC CHART Data = dataset;
	VBAR ide/subgroup=mal;
RUN;


/* Part 6 */
PROC PLOT data=DataSet;
      plot ash * mal = '*';
      BY ide;
run;

/*
PROC SGPLOT DATA = DataSet;
	BY ide;
	scatter x = mal y = ash; 
RUN;

PROC PRINT data= DataSet LABEL; 
RUN;
*/



