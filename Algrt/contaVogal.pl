vogal(a) :- !.
vogal(e) :- !.
vogal(i) :- !.
vogal(o) :- !.
vogal(u) :- !.

contaVogal([], S) :- S is 0, !.

contaVogal([H|T], S) :- vogal(H), contaVogal(T, SR), S is 1 + SR, !;
	contaVogal(T, SR), S is SR.



% ----------- simplificado
vogal(a, 1) :- !.
vogal(e, 1) :- !.
vogal(i, 1) :- !.
vogal(o, 1) :- !.
vogal(u, 1) :- !.
vogal(_, 0).

contaVogal([], 0) :- !.

contaVogal([H|T], S) :- vogal(H, ST), contaVogal(T, SR), S is ST + SR.