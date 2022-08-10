% X = 1 se num de elementos de L é par ...
numElemPar([_],0) :- !.
numElemPar([_,_],1) :- !.
numElemPar([_|T],0) :- numElemPar(T,1),!.
numElemPar([_|T],1) :- numElemPar(T,0).