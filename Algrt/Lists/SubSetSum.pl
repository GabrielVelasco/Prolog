% Take a look at board to a better understanding 
sss([H|T], K, [H|SolR]) :-
    H == K, SolR = [], !;
	NewK is K - H,			% H faz parte da Solucao
	sss(T, NewK, SolR).		% Tira H de K, e diminui a lista (tira H da lista == T)

sss([_|T], K, Sol) :- 		% H nao faz parte da Solucao
	sss(T, K, Sol).			% Existe subset da T cuja soma == K?