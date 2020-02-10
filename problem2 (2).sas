data TransferCost;
INPUT  name $1-14. from $16-26. to $28-37. pounds_million 38-43;
datalines;
Benjamin Mendy Monaco      Man City   52.0
Alvaro Morata  Real Madrid Chelsea    58.0
Romelu Lukaku  Everton     Man United 75.0
Neymar         Barcelona   PSG        199.8
;
run;
proc print data=TransferCost;
	var name from to pounds_million;
run;