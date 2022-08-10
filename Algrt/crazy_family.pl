mother_of(mary, author).
grandmother_of(sherry, author).
dead(sherry).
brother_of(author, barry).
uncle_of(harry, author).
military(harry).
sister_of(carol, author).
traded(carol, bow_arrow, loaded_double_barrel).
wears_old_clotches_of(carol, author).
got_locked(carol).

familys_is_crazy(X) :-
	sister_of(Y, X),
	traded(Y, bow_arrow, loaded_double_barrel),
	got_locked(Y).

