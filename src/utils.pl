
atom_int(Atom,Int):- atom_chars(Atom, Y), number_chars(Int, Y).

actual_length([],Length,Length).

actual_length([Adj|T],Acc,Clean):-
	(atom(Adj) ; integer(Adj)),
	NewAcc is Acc+1,
	actual_length(T,NewAcc,Clean).

actual_length(_,Length,Length).

getCleanAdjs([],Clean,Clean).

getCleanAdjs([Adj|T],Acc,Clean):-
	(atom(Adj) ; number(Adj)),
	append(Acc,[Adj],NewAcc),
	getCleanAdjs(T,NewAcc,Clean).

getCleanAdjs(_,Clean,Clean).

getHighestPop(AutorId, MaxPop):-
	findall(LivroPop, (livro(_,_,Autores,_,_,LivroPop),member(AutorId, Autores)), Pops),
	max_list(Pops,MaxPop).
	
getLowestPop(AutorId, MinPop):-
	findall(LivroPop, (livro(_,_,Autores,_,_,LivroPop),member(AutorId, Autores)), Pops),
	min_list(Pops,MinPop).
	
multiple_adjs_solver([], _, _, []).
multiple_adjs_solver([Adj|T], ser, autor, [L|L1]) :-
	P1 =.. [ser, AutID, _, _, [Adj], _, _, _],
	P2 =.. [autor, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	findall(Res, (P1, P2, atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	multiple_adjs_solver(T, ser, autor, L1).
	
multiple_adjs_solver([], _, _, _, _, []).
multiple_adjs_solver([Adj|T], ser, livro, autor, existir, [L|L1]) :-
	P1 =.. [existir, LivroID, _, _, _, _, _, _, [Adj]],
	P2 =.. [livro, LivroID, Titulo, _, _, _, _],
	findall(Titulo, (P1, P2), L),
	multiple_adjs_solver(T, ser, livro, autor, existir, L1).

multiple_adjs_solver([], _, _, _, _, _, []).	
multiple_adjs_solver([Adj|T], [Seculo], ser, autor, seculo, Prep, [L|L1]) :-
	P1 =.. [ser, AutID, _, _, [Adj], _, _, _],
	P2 =.. [autor, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	findall(Res, (P1, P2, (nascer(AutID, _, _, _, Prep, seculo, [Seculo]); morrer(AutID, _, _, _, Prep, seculo, [Seculo])), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	multiple_adjs_solver(T, [Seculo], ser, autor, seculo, Prep, L1).
	
multiple_adjs_solver([], _, _, _, _, _, _, []).	
multiple_adjs_solver([Adj| T], [conhecido], ser, autor, livro, Adv, Prep, [L|L1]) :-
	P =.. [ser, Titulo, _, Adv, [conhecido], Prep, AutID, _],
	P1 =.. [livro, _, Titulo, Autores, _, _, _],
	P2 =.. [ser, AutID, _, _, [Adj], _, _, _],
	findall(Titulo, (P2, P1, P, member(AutID, Autores)), L),
	multiple_adjs_solver(T, [conhecido], ser, autor, livro, Adv, Prep, L1).
	

	
not_member(_, []) :- !.

not_member(X, [Head|Tail]) :-
     X \= Head,
    not_member(X, Tail).
	
count(0, []).
count(Count, [Head|Tail]) :- write('Count: '), write(Count), nl, atom(Head), count(TailCount, Tail), Count is TailCount + 1.
count(_, _).