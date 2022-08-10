vogal(a) :- !.
vogal(e) :- !.
vogal(i) :- !.
vogal(o) :- !.
vogal(u) :- !.

tiraVog([X], []) :- vogal(X) , !.
tiraVog([X], [X]) :- \+vogal(X), !.

tiraVog([H|T], R) :-
	vogal(H), tiraVog(T, R), !. % H nao faz parte da resposta

tiraVog([H|T], [H|R]) :-		% H faz parte da resposta
	\+vogal(H),					% comfirma que H não é vogal
	tiraVog(T, R).				% R == T sem vogais