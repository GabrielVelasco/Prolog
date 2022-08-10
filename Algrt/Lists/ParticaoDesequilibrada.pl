somaLista([],0) :- !.
somaLista([X],X) :- !.
somaLista([H|T],S) :- somaLista(T,Sr), S is H +Sr,!.

particaoD([],P1,P2,D) :- somaLista(P1,S1),somaLista(P2,S2), D is S1-S2,!.

particaoD([H| T], [H| P1r], P2, D) :- Dr is D+H, particaoD(T, P1r, P2, Dr).
particaoD([H| T], P1, [H| P2r], D) :- Dr is D-H, particaoD(T, P1, P2r, Dr).