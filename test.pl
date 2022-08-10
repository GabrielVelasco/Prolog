% 1)
intersec([I1,F1], [I2,F2]) :-
	I2 >= I1, I2 =< F1, !;
	I1 >= I2, I1 =< F2.

%           A       B, verf se A esta contido em B
contido([I1,F1], [I2,F2], R) :-
	I2 =< I1, F2 >= F1, R = [I2,F2], !;
	I1 =< I2, F1 >= F2, R = [I1,F1], !.

colapsa([I,F], [I,F], [I,F]) :- !.

colapsa([I1,F1], [I2,F2], R) :-
	contido([I1,F1], [I2,F2], R), !;
	I2 < I1, colapsa([I2,F2], [I1,F1], R), !;
	F1 - I2 >= -1, R = [I1,F2].