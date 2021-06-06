%% =====================KNIGHT TOUR=====================================

% Cavalo vai de uma caasa branca para casa preta para branca para preta ...
% logo para um tour a quantidade de casas pretas e brancas tem que ser igual
% ou seja, quantidade total de casa do tabuleiro de que ser PAR.

verf([_|T]) :- T = [], !.
verf([H1, H2|T]) :-
    knightJump(H1, H2), verf([H2|T]), !.

memb(_, []) :- !, fail.
memb(D, [H|T]) :-
	D = H, !;
	memb(D, T).

% Casa 		orig   -> Dest:
knightJump([L1,C1], [L2, C2]) :-
	L2 is L1 + 1, C2 is C1 + 2;
	L2 is L1 + 1, C2 is C1 - 2;

	L2 is L1 - 1, C2 is C1 + 2;
	L2 is L1 - 1, C2 is C1 - 2;

	L2 is L1 + 2, C2 is C1 + 1;
	L2 is L1 + 2, C2 is C1 - 1;

	L2 is L1 - 2, C2 is C1 + 1;
	L2 is L1 - 2, C2 is C1 - 1.

% LI == Linha inicial da parte a ser resolvida, LF = linha final ...
% Usada para pular dentro de uma parte PX ou de PX -> PY
knightJumpP([L1,C1], [L2, C2], LI, LF) :-
	knightJump([L1,C1], [L2, C2]),
	L2 >= LI, L2 =< LF, C2 >= 1, C2 =< 10.

geraPosIni([5,1]).
geraPosIni([5,2]).
geraPosIni([5,3]).
geraPosIni([5,4]).
geraPosIni([5,5]).
geraPosIni([5,6]).
geraPosIni([5,7]).
geraPosIni([5,8]).
geraPosIni([5,9]).
geraPosIni([5,10]).

%% P3 3x10
%% P2 3x10
%% P1 3x10

tour(R) :-
	geraPosIni(PosIniP2), 				% gera pos inicial em P2
	knightJumpP(PosIniP2, CasaP3, 1, 3),	% pula de P2 para P3
	tourP3([CasaP3], [FimP3|T3]),

	knightJumpP(FimP3, NovaCasaP2, 4, 6),
	\+NovaCasaP2 = PosIniP2,
	tourP2([NovaCasaP2], [FimP2|T2], PosIniP2),
	
	knightJumpP(FimP2, CasaP1, 7, 9),
	tourP1([CasaP1], [FimP1|T1]),
	knightJumpP(FimP1, PosIniP2, 4, 6), 

	append([FimP3|T3], [PosIniP2], LP3),
	append([FimP2|T2], LP3, LP32),
	append([FimP1|T1], LP32, R) , !.
	

tourP3([[L,C]|T], [[L,C]|T]) :-	length([[L,C]|T], Len), Len is 30, L >= 2, !. % FimP1 deve tocar P2
tourP3([H|T], R) :-	knightJumpP(H, Dest, 1, 3), \+memb(Dest, T), tourP3([Dest, H|T], R).

tourP2([[L,C]|T], [[L,C]|T], _) :-	length([[L,C]|T], Len), Len is 29, L >= 5, !. % FimP1 deve tocar P2
tourP2([H|T], R, PosIniP2) :-	knightJumpP(H, Dest, 4, 6),  \+Dest = PosIniP2, \+memb(Dest, T), tourP2([Dest, H|T], R, PosIniP2).

tourP1([[L,C]|T], [[L,C]|T]) :-	length([[L,C]|T], Len), Len is 30, L =< 7, !. % FimP1 deve tocar P2
tourP1([H|T], R) :-	knightJumpP(H, Dest, 7, 9), \+memb(Dest, T), tourP1([Dest, H|T], R).