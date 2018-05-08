
atom_int(Atom,Int):- atom_chars(Atom, Y), number_chars(Int, Y).

actual_length([],Length,Length).

actual_length([Adj|T],Acc,Clean):-
	atom(Adj),
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