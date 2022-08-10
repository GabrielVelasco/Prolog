%	P == frog jump height
%	[H|T] == list of pipes heights

%	base case
frog(_, []) :- !.

%	general case
frog(P, [H, HT|T]) :-
	Dist is abs(HT-H), Dist =< P, frog(P, T).