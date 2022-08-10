% in: 5 in 0..6 == true
% in: 7 in 8..15 == false

% ins: [5,6] ins 0..6 == true
% ins: [3,7] ins 8..15 == false
% sat(1 =:= (~0 + 1)).

%% =====================================================================================

%% uri1272(input, out)
%% in -> [ [], [a], [c,o,m,p,e,t,e], [o,n,l,i,n,e],[e,v,e,n,t],[r,a,t,i,n,g] ]
%% out -> [c, o, e, r]

pegaPrimeiro([P|_], P) :- !.
pegaPrimeiro([P], P) :- !.
	
uri([], []) :- !.
uri([H|T], R) :-
	\+H = [],						% espaco
	pegaPrimeiro(H, Rr),			% pega primeiro elem da sublista H
	uri(T, Rtmp),
	R = [Rr|Rtmp], !;

	uri(T, R).
	
%% =====================================================================================
% todo:
%	ex URI
%	pertence
%	correc assigment