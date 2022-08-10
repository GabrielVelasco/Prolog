% intercala duas listas (ordem cresc.)

% caso base
inter([], L, L) :- !.
inter(L, [], L) :- !.

% caso geral
inter([H1|T1], [H2|T2], LF) :-
	H1 < H2,
	inter(T1, [H2|T2], RestoLista), LF = [H1|RestoLista], !;	% H1 ja tem lugar (1°)
	inter([H1|T1], T2, RestoLista), LF = [H2|RestoLista].	% H1 >= H2, logo H2 ja tem lugar