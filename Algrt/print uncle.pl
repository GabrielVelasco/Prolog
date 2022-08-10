parents(bob, carl).
brother(bob, bill).

print_uncle :- 
	parents(X,carl),
	brother(X,Y),
	format('~w is carl uncle', [Y]).