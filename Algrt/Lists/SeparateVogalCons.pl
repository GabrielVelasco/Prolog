%  TODO: breake(List, Vog, Cons)


%         IN1 IN2 |OUT1  OUT2
% brake([H|T], P, Left, Right), where Left = List of elements < P
% 									  Right = List of elements >= P

% breake([H], P, Left, []) :- H =< P, Left is H, !.
% breake([H], P, [], Right) :- H > P, Right is H, !.			% H > P
% reduced:

vogal(X) :- member(X, [a,e,i,o,u]).

breake([H], [H], []) :- vogal(H), !.
breake([H], [], [H]) :- !.

% H <= P, so H will be a part of Left list.
breake([H|T], [H|Vog], Cons) :-
	vogal(H), breake(T, Vog, Cons), !.

% H > P, so H will be a part of Right list.
breake([H|T], Vog, [H|Cons]) :-
	breake(T, Vog, Cons), !.