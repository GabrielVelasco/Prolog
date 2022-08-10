%% retiraDuplicado([],[]).
%% retiraDuplicado([X],[X]).
%% 				% in     %out
%% retiraDuplicado([X,X|Xs],  W) :- retiraDuplicado([X|Xs],W).
%% retiraDuplicado([X,Y|U],   [X|W]) :- X \= Y, retiraDuplicado([Y|U],W).

% caso base
retiraDup([], []) :- !.
retiraDup([X], [X]) :- !.

% caso geral
retiraDup([H|T], Tr) :-
	member(H, T),
	retiraDup(T, Tr), !.

retiraDup([H|T], [H|Tr]) :-
	\+member(H, T),
	retiraDup(T, Tr).