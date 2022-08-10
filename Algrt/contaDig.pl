%conta7(N, D, S2) :-
%	N < 10, N = D, S2 is 1, !;
%	N < 10, N \== D, S2 is 0, !.

conta7(N, N, 1) :- N < 10, !.
conta7(N, _, 0) :- N < 10, !.

conta7(N, D, S) :-
	T is N mod 10,
	T=D, Tt is N//10, conta7(Tt, D, S2),
	S is 1 + S2, !;

	Tt is N//10,
	conta7(Tt, D, S2),
	S is S2.


contaD(N, 1) :-
	N < 10, !.

contaD(N, C) :-
	Temp is N//10,
	contaD(Temp, CR),
	C is 1 + CR.