% in: 5 in 0..6 == true
% in: 7 in 8..15 == false

% ins: [5,6] ins 0..6 == true
% ins: [3,7] ins 8..15 == false
% sat(1 =:= (~0 + 1)).

%% =====================================================================================

mochila([[Valor,Peso]],Obj,Capacidade, R) :- 
	Capacidade>=Peso, Valor>=Obj, R = [[Valor,Peso]], !;
	R = [].

mochila([[Valor,Peso]|T],Obj,Capacidade, R) :- 	% R == itens que vao ser roubados
	Capacidade>=Peso, Valor>=Obj, R = [[Valor,Peso]];

	Capacidade>=Peso, NC is Capacidade-Peso,
	NO is Obj-Valor, mochila(T,NO,NC,Rr), R = [[Valor,Peso]|Rr];

	mochila(T,Obj,Capacidade, R).
	
%% =====================================================================================
% todo:
%	pertence
%	correc assigment

%% [ [0.5, 1], [2, 5], [0.5, 4], [1.5, 3], [0.3, 7], [3.5, 9] ]


%% obj = 3
%% c = 10