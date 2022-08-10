entrada(alface,10).
entrada(tomate,12).
entrada(legumes,17).
entrada(rucula,15).

principal(pf,75).
principal(lasanha,99).
principal(feijoada,120).
principal(macarrao,83).

sobremesa(gelatina,22).
sobremesa(sorvete,33).
sobremesa(pudim,15).
sobremesa(sem,0).

tipo(diet).
tipo(normal).
tipo(glutao).

verf(Tipo, S) :-
	Tipo = 'normal';
	Tipo = 'diet', S < 131, write(S);
	Tipo = 'glutao', S > 145, write(S).

menu(Tipo, Ent, Prin, Sob) :-
	tipo(Tipo),
	entrada(Ent, X), principal(Prin, Y), sobremesa(Sob, Z),
	S is X+Y+Z,
	verf(Tipo, S).