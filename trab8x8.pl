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

% Usada para pular dentro de uma parte PX ou de PX -> PY
knightJumpP([L1,C1], [L2, C2], LI, LF) :-
	knightJump([L1,C1], [L2, C2]),
	L2 >= LI, L2 =< LF, C2 >= 1, C2 =< 8.

geraPosIni([5,1]).
geraPosIni([5,2]).
geraPosIni([5,3]).
geraPosIni([5,4]).
geraPosIni([5,5]).
geraPosIni([5,6]).
geraPosIni([5,7]).
geraPosIni([5,8]).
geraPosIni([6,1]).
geraPosIni([6,2]).
geraPosIni([6,3]).
geraPosIni([6,4]).
geraPosIni([6,5]).
geraPosIni([6,6]).
geraPosIni([6,7]).
geraPosIni([6,8]).

tour(R) :-
	geraPosIni(PosIni), 							% gera pos inicial na parte P1, na fronteira com P2
	tourP1([PosIni], [FimP1|T1]),					% tour primeira parte, percorre 32 casas de P1		
	knightJumpP(FimP1, IniP2, 1, 4),				% conecta P1 -> P2

	tourP2([IniP2], [FimP2|T2]),
	knightJumpP(FimP2, PosIni, 5, 8),				% verifica se FimP2 'toca' PosIni (anda todas e volta para inicial)
	append([FimP2|T2], [FimP1|T1], R), !.				% Instancia R com o caminho válido.

tourP1([[L,C]|T], [[L,C]|T]) :-	length([[L,C]|T], Len), Len is 32, L =< 6, !. % FimP1 deve tocar P2
tourP1([H|T], R) :-	knightJumpP(H, Dest, 5, 8), \+memb(Dest, T), tourP1([Dest, H|T], R).

tourP2([[L,C]|T], [[L,C]|T]) :-	length([[L,C]|T], Len), Len is 32, L >= 3, !. % FimP2 deve tocar P1
tourP2([H|T], R) :-	knightJumpP(H, Dest, 1, 4), \+memb(Dest, T), tourP2([Dest, H|T], R).