ack(0, N, S) :- T is N+1, S is T, !.
ack(M, 0, S) :- M > 0, T is M-1, ack(T, 1, S), !.

ack(M, N, S) :- 
		T is M-1, T2 is N-1, ack(M, T2, T3), ack(T, T3, S), !.