g(N, A, B, X) :-
	N = 0, X is A, !;
	T is N-1,
	Tt is A+B,
	g(T, B, Tt, X).

f(N, X) :-
	g(N, 0, 1, X).