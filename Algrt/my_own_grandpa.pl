male(author).
male(authors_father).

married(author, widow).
married(authors_father, widows_daughter).

parent_is(author, authors_father).
parent_is(widows_daughter, widow).
parent_is(widows_daughter, author).
parent_is(authors_father, author).
parent_is(author, widows_daughter).
parent_is(authors_baby, author).
parent_is(authors_baby, widow).

brothers(authors_baby, widows_daughter).
brothers(authors_baby, authors_father).
brothers(widows_daughter, authors_baby).
brothers(authors_father, authors_baby).

uncle(X, U) :-
	parent_is(X, Y),
	brothers(Y, U).

grandpa_is(X, U) :-
	male(U),
	parent_is(X, Y),
	parent_is(Y, U).