% intercala duas listas (ordem cresc.)
% caso base
inter([], L, L) :- !.
inter(L, [], L) :- !.

% caso geral
inter([H1|T1], [H2|T2], LF) :-
	H1 < H2,
	inter(T1, [H2|T2], RestoLista), LF = [H1|RestoLista], !;	% H1 ja tem lugar (1°)
	inter([H1|T1], T2, RestoLista), LF = [H2|RestoLista].	% H1 >= H2, logo H2 ja tem lugar


% split list (split([1,2,3,4,5,6], L1,  L2) -> L1 == [1,2,3] && L2 == [4,5,6])
% 					IN  	     OUT1, OUT2	
split([], [], []) :- !.
split([X], [X], []) :- !.

split([H|T], FirstHalf, SecondHalf) :-
	split(T, FirstHalfT, SecondHalfT), FirstHalf = [H|SecondHalfT], SecondHalf = FirstHalfT.


% sort listas usando meia()
% base
sortListSplit([], []) :- !.
sortListSplit([X], [X]) :- !.

sortListSplit(L, Sorted) :-
	split(L, FirstHalf, SecondHalf),
	sortListSplit(FirstHalf, FirstHalfSorted), sortListSplit(SecondHalf, SecondHalfSorted),
	inter(FirstHalfSorted, SecondHalfSorted, Sorted).