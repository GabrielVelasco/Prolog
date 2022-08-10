listaMaior([X],X) :- !.

listaMaior([H|T],H) :- listaMaior(T,X), H>X,!.
listaMaior([_|T],X) :- listaMaior(T,X).