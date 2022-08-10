listaDuplicadoSeguidos([X,X]) :- !.
listaDuplicadoSeguidos([H,H|_]) :- !.
listaDuplicadoSeguidos([_|T]) :- listaDuplicadoSeguidos(T).