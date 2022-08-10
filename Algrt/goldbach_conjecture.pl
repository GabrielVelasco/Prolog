composto(N) :- N>2, N mod 2 =:= 0;
	composto_impar(N,3).

composto_impar(N,F) :- F<N, N mod F =:= 0,!;
	F<N, Fp is F + 2,composto_impar(N,Fp).

eh_primo(2) :- !.
eh_primo(3) :- !.

eh_primo(N) :-
	\+composto(N).

pp(X,N) :- P is X+1, eh_primo(P), N is P,!;
	pp(X+1,N1), N is N1.

goldbatch_second(N, Pp) :-
	T is N - Pp,
	eh_primo(T),!;

	pp(Pp, Ppp),
	goldbatch_second(N, Ppp).

goldbatch(N) :-
	N>2, N mod 2 =:= 0,
	T is N - 2,
	eh_primo(T);

	N>2, N mod 2 =:= 0,
	goldbatch_second(N, 3).