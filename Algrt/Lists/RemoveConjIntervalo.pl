% in: 5 in 0..6 == true
% in: 7 in 8..15 == false

% ins: [5,6] ins 0..6 == true
% ins: [3,7] ins 8..15 == false
% sat(1 =:= (~0 + 1)).

%% =====================================================================================

verf([IR,FR], [I1,F1], [I2,F2]) :-
	IR >= I1, IR =< F1, FR >= I2, FR =< F2.

quebraDois([IR,FR], [[I1,F1]|T], R) :-
	IR > I1, FR < F1,
	NF1 is IR-1, NH1 = [I1,NF1],
	NI2 is FR+1, NH2 = [NI2,F1], R = [NH1,NH2|T], !;

	quebraDois([IR,FR], T, Rr), R = [[I1,F1]|Rr]. 

% começa em um termina em outro
% cria e novos intervalos
comecaUmTerminaOutro([IR,FR] ,[[I1,F1],[I2,F2]|T], R) :-
	verf([IR,FR], [I1,F1], [I2,F2]), NF is IR-1, NH1 = [I1,NF], NI is FR+1, NH2 = [NI, F2], R = [NH1,NH2|T], !;

	comecaUmTerminaOutro([IR,FR], [[I2,F2]|T], Rr), R = [[I1,F1]|Rr].

% verf se intervalo existe
existe([IR,FR], [[I1,F1],[I2,F2]|T]) :-
	IR >= I1, IR =< F1, !;	
	IR >= I2, IR =< F2, !;
	IR >= I1, IR =< F1, FR >= I2, FR =< F2, !;

	existe([IR,FR], T).


remove2([IR,FR], [[I1,F1]|T], R) :-
	IR = I1, FR = F1, R = T, !;

	remove2([IR,FR], T, Rr), R = [[I1,F1]|Rr].

remove(I, List, R) :-
	\+existe(I, List), R = List, !;
	member(I, List), remove2(I, List, R), !; % intervalo existe, remove-lo
	quebraDois(I, List, R), !;
	comecaUmTerminaOutro(I, List, R), !.
	% falta caso em que "quebra" um intervalo em 2.
	
%% =====================================================================================
% todo:
%	pertence
%	correc assigment