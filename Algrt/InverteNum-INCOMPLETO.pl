% nao funciona para N00N...
contaD(N, 1) :-
	N < 10, !.

contaD(N, C) :-
	Temp is N//10,
	contaD(Temp, CR),
	C is 1 + CR.

lastD(N, D) :- D is N mod 10.

pow(_, 0, 1) :- !.
pow(N, 1, N) :- !.

pow(N, Q, R) :-
	T1 is Q-1,
	pow(N, T1, RR),
	R is RR * N.

% UltimoDigt = 3
% Temp1 = 12 rot --> 21



% QntDigitos = 2
% Temp2 = 100
% Temp3 = 3 * 100 == 300
% R = 300 + 12 == 312

rot(N, N) :-
    N < 10, !.

rot(N, R) :-
	lastD(N, UltimoDigt),
	Temp1 is N//10,
	rot(Temp1, RR),
	contaD(RR, QntDigitos),
	pow(10, QntDigitos, Temp2),
	Temp3 is Temp2 * UltimoDigt,
	R is Temp3 + RR, !.