%  TODO: breake(List, Vog, Cons)


%         IN1 IN2 |OUT1  OUT2
% brake([H|T], P, Left, Right), where Left = List of elements < P
% 									  Right = List of elements >= P

% breake([H], P, Left, []) :- H =< P, Left is H, !.
% breake([H], P, [], Right) :- H > P, Right is H, !.			% H > P
% reduced:
breake([H], P, [H], []) :- H =< P, !.
breake([H], _, [], [H]) :- !.

% H <= P, so H will be a part of Left list.
breake([H|T], P, [H|Left], Right) :-
	H =< P, breake(T, P, Left, Right), !.

% H > P, so H will be a part of Right list.
breake([H|T], P, Left, [H|Right]) :-
	H > P, breake(T, P, Left, Right), !.