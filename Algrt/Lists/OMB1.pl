div7ou13(H1, H2) :-
	%% Verf se H1H2 == Res eh div 7 ou 13
	Res is H1 * 10 + H2,
	Res mod 7 =:= 0, !;

	Res is H1 * 10 + H2,
	Res mod 13 =:= 0.

%% caso base
regraVerDuplasSeq([_|T]) :-
	T = [], !.

%% caso geral
regraVerDuplasSeq([H1, H2|T]) :-
	%% pega 2 heads por vez e verf div7ou13(H1, H2) 
	div7ou13(H1, H2),
	regraVerDuplasSeq([H2|T]).


omb1(L, X) :-
	permutation(L, X), regraVerDuplasSeq(X), !.

%% a1, a2, a3,...a9
%% a1a2 tem q ser div por 7 ou 13
%% a2a3 tem q ser div por 7 ou 13
%% ...


%% - OBM1
%% - OBM2