ack(M,N,X) :- M =:= 0, X is N+1, !.
ack(M,N,X) :- M>0, N=:=0, Mr is M-1, ack(Mr,1,X),!.
ack(M,N,X) :- Mr is M-1, Nr is N-1, ack(M,Nr,Y), ack(Mr,Y,X),!.