%% bin to decimal converter
%% [0,0,1,0] == 2 ...

%% binDec([], Acum, Acum) :- !.    

%% tentei fazer meio q na forca bruta!
%% binDec([H|T], Acum, Ans) :-
%%     H == 1,
%% 	length([H|T], Size),
%% 	Exp is Size - 1,
%% 	Poww is 2**Exp,
%% 	BitValue is H*Poww,
%%     Tmp is Acum + BitValue,
%% 	binDec(T, Tmp, Ans), !;
    
%%     binDec(T, Acum, Ans).   
%% =================================================================== 


%% pensando de uma maneira mais recursiva e prologuista!
%% binDec([0], 0) :- !.
%% binDec([1], 1) :- !.

%% binDec([H|T], Ans) :-
%% 	length([H|T], Size),
%% 	Exp is Size - 1,
%% 	Poww is 2**Exp,
%% 	Dec is H*Poww,
%% 	binDec(T, AnsR),
%%     Ans is AnsR + Dec.

%% ======================================================================

%% anterior * 2 + digit Bin(0,1)
%% anterio = 0 na chamada?

binDec([], A, A) :- !.

%% binDec([0|T], A, R) :- AR is A * 2, binDec(T, AR, R), !.
%% binDec([1|T], A, R) :- AR is A * 2 + 1, binDec(T, AR, R), !.
binDec([H|T], Ante, R) :- AnteAtual is Ante * 2 + H, binDec(T, AnteAtual, R), !.

binDec(L, R) :-
	binDec(L, 0, R).