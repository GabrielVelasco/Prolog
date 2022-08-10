media(In1, In2, In3, In4) :-
	Var is In1+In2+In3+In4,
	Var2 is Var/4,
	write(Var2).

divAB(In1, In2) :-
	Var is In1/In2,
	format('divisao ~w por ~w = ~2f', [In1, In2, Var] ). % ~2f para 2 casa dec %