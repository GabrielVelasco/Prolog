isLeap(N) :-
	N mod 400 =:= 0, !;
	N mod 4 =:= 0, N mod 100 =\= 0, !.

isHulu(N) :-
	N mod 15 =:= 0, !.
    
isBulu(N) :-
	isLeap(N), N mod 55 =:= 0, !.

isOrd(N, Odinary) :-
	\+isLeap(N), \+isHulu(N), \+isBulu(N), Odinary is 1, !;
    Odinary is 0.

isLeap(N, Leap) :-
	N mod 400 =:= 0, Leap is 1, !;
	N mod 4 =:= 0, N mod 100 =\= 0, Leap is 1, !;
	Leap is 0.

isHulu(N, Hulu) :-
	N mod 15 =:= 0, Hulu is 1, !;
	Hulu is 0.

isBulu(N, Bulu, Leap) :-
	Leap is 1, N mod 55 =:= 0, Bulu is 1, !;
	Bulu is 0.

yearProp(N, Leap, Hulu, Bulu, Odinary) :-
	isLeap(N, Leap); 
	isHulu(N, Hulu);
	isBulu(N, Bulu, Leap);
	isOrd(N, Odinary), !.