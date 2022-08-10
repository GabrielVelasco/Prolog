estaContido([], _) :- !, fail.	% "retorna" false

estaContido([H|T], X) :- % X esta contido em [...]?
    H == X, !;
    estaContido(T, X).
    
% Algum elemento da lista duplicado?
duplicado([H|T]) :-
    estaContido(T, H), !; % se H esta contido em T.
	duplicado(T).