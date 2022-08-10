% in: 5 in 0..6 == true
% in: 7 in 8..15 == false

% in: [5,6] ins 0..6 == true
% in: [3,7] in 8..15 == false
% sat(1 =:= (~0 + 1)).

%% =====================================================================================
somaPar(_, 0, Rr) :- Rr = [], !.
somaPar([H], K, [H]) :- H == K, !.

somaPar([H|T], K, R) :-
	Nk is K - H,
	somaPar(T, Nk, Rr),
    R = [H|Rr];
    
	somaPar(T, K, R).

% 1am, vai da tempo de optimizar nkkkkkkkkkkkkk me da nota??? :( to sem grupo pro trabalho.

