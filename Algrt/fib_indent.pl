% com esses fatos calcula fib(N) para N <= 20, para N > 20 Deus nao me deu o dom de resolver :)
% fib(1,1).
% fib(2,1).
% fib(3,2).
% fib(4,3).
% fib(5,5).
% fib(6,8).
% fib(7,13).
% fib(8,21).
% fib(9,34).
% fib(10,55).

% usando essas regras/fatos calcula fib de qualquer coisa (confia)
fib(1,1).
fib(2,1).
fib(N,F) :- N>2, T1 is N-1,T2 is N-2,
	fib(T1,F1),fib(T2,F2),
	F is F1+F2.

fibIdent(X, S) :-
	X mod 2 =:= 0,
	N is X // 2,
	T is N-1,
	fib(N, Res1), fib(T, Res2),	    % Res1 == fib(8) e Res2 == fib(7)
	T1 is Res1*Res1, 				% T1 == fib(8)²
	T2 is 2*Res2*Res1,
	S is T1+T2, !;

	N is (X - 1) // 2,
	T is N+1,
	fib(T, Res1), fib(N, Res2),
	T1 is Res1*Res1,
	T2 is Res2*Res2,
	S is T1+T2, !.