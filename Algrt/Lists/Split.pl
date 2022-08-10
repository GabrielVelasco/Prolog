% split list (split([1,2,3,4,5,6], L1,  L2) -> L1 == [1,2,3] && L2 == [4,5,6])
% 					IN  	     OUT1, OUT2	
split([], [], []) :- !.
split([X], [X], []) :- !.

split([H|T], FirstHalf, SecondHalf) :-
	split(T, FirstHalfT, SecondHalfT), FirstHalf = [H|SecondHalfT], SecondHalf = FirstHalfT.