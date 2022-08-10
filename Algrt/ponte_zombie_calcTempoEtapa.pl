calculaTempo(E, NE, C, NC, P, NP, Z, NZ, Tempogasto) :-
	Z \== NZ, Tempogasto is 10, !;
	P \== NP, Tempogasto is 5, !;
	C \== NC, Tempogasto is 2, !;
	E \== NE, Tempogasto is 1.