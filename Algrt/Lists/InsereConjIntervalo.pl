% in: 5 in 0..6 == true
% in: 7 in 8..15 == false

% ins: [5,6] ins 0..6 == true
% ins: [3,7] ins 8..15 == false
% sat(1 =:= (~0 + 1)).

%% =====================================================================================

% CONSIDERA QUE APENAS UM INTERVALO E INSERIDO E 'R' INSTANCIADO, OS OUTROS INTERVALOS (LISTA ORIGINAL)
% JA PRESENTES ESTAO NA ORDEM CORRETA!!!!

inCresc([IniAdd, FimAdd], [], [[IniAdd, FimAdd]]) :- !.
%         intervalo        Lista de inserc       lista final
inCresc([IniAdd, FimAdd], [ [IniLst,FimLst]|T ], ListComInter) :-
    	IniAdd =< IniLst, ListComInter = [ [IniAdd, FimAdd], [IniLst,FimLst] |T], !;
    
    	inCresc([IniAdd, FimAdd], T, Lr), ListComInter = [[IniLst,FimLst] |Lr].


%           A       B, verf se A esta contido em B
contido([I1,F1], [I2,F2]) :-
	I2 =< I1, F2 >= F1.

% regra gruda
gruda([[I,F]], [[I,F]]) :- !.

gruda( [[I1,F1],[I2,F2] |T], R) :-
	F1 - I2 >= -1, IntF = [I1,F2], ListF = [IntF|T], gruda(ListF, R), !;		% H1 e H2 vira um só intervalo
	ListF = [[I2,F2] |T], gruda(ListF, Rr), R = [[I1,F1]|Rr].

% regra unir() trata casos de [I,F] contido em algum Intervalo da lista, [I,F] no começo, final e meio. 
% compara 2 intervalos, 2 Heads.
% 

unir([[I,F]], [[I,F]]) :- !.

    	 % H1    H2			
unir( [[I1,F1],[I2,F2] |T], R) :-
	% H1 contido em H2 ? Interv final = H2
	contido([I1,F1], [I2,F2]), IntF = [I2,F2], ListF = [IntF|T], unir(ListF, R), !;
	% H2 contido em H1 ? Interv final = H1
	contido([I2,F2], [I1,F1]), IntF = [I1,F1], ListF = [IntF|T], unir(ListF, R), !;

    unir( [[I2,F2] |T], Rr), R = [[I1,F1]|Rr].		% H1 se mantem


insere(I, List, R) :-
	inCresc(I, List, ListComInt),					% I = [Ini, Fim], insere I em List na ordem cresc por campo 'Ini'
	unir(ListComInt, ListUnif),
	gruda(ListUnif, R).
	
%% =====================================================================================
% todo:
%	pertence
%	correc assigment