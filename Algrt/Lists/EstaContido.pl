% X esta contido na lista?

estaContido([], _) :- !, fail.	% "retorna" false

estaContido([H|T], X) :-
    H == X, !;
    estaContido(T, X).