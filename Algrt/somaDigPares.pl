ehPar(N) :- N mod 2 =:= 0, !.

somaPares(N, N) :- N < 10, ehPar(N), !.
somaPares(N, 0) :- N < 10, \+ehPar(N), !.

somaPares(N, S) :-
	T is N mod 10,
	ehPar(T), T2 is N//10,
	somaPares(T2, SR),
	S is SR + T, !;

	T2 is N//10,
	somaPares(T2, SR),
	S is SR.