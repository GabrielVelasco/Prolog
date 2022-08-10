intersec([],[], []).
intersec([],_, []).
intersec(_,[], []).
         % in1 in2  out
intersec([H|T],L2, [H|Tr]) :- member(H,L2),intersec(T,L2,Tr),!.
intersec([_|T],L2, Tr) :- intersec(T,L2,Tr),!.