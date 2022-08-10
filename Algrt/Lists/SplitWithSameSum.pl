list_sum([Item], Item).
list_sum([Item1,Item2 | Tail], Total) :-
	Tmp is Item1+Item2,
    list_sum([Tmp|Tail], Total).

listDiff([],[],[]).
listDiff([],_,[]).
listDiff(_,[],_).

listDiff([H|T],L2,[H|Tr]) :- \+member(H,L2),listDiff(T,L2,Tr),!.
listDiff([_|T],L2,Tr) :- listDiff(T,L2,Tr),!.

sss([H|T], K, [H|SolR]) :-
    H == K, SolR = [], !;
	NewK is K - H,			% H faz parte da Solucao
	sss(T, NewK, SolR), !.		% Tira H de K, e diminui a lista (tira H da lista == T)

sss([_|T], K, Sol) :- 		% H nao faz parte da Solucao
	sss(T, K, Sol).			% Existe subset da T cuja soma == K?

particiona(L, FirstHalf, SecondHalf) :-
	list_sum(L, ListSum),
	ListSum mod 2 =:= 0, 
	K is ListSum // 2,
	sss(L, K, FirstHalf),
	listDiff(L, FirstHalf, SecondHalf).		% SecHalf = L - FistHalf
