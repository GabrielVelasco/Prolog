% gera todas listas bin de tamanho N
zeroUm(1).
zeroUm(0).

geraLista([X],1) :- zeroUm(X).
geraLista([H|T],N) :- N>1, NM is N-1, geraLista(T,NM),zeroUm(H).
