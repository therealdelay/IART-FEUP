
atom_int(Atom,Int):- atom_chars(Atom, Y), number_chars(Int, Y).

actual_length([],Length,Length).

actual_length([Adj|T],Acc,Clean):-
	(atom(Adj) ; integer(Adj)),
	NewAcc is Acc+1,
	actual_length(T,NewAcc,Clean).

actual_length(_,Length,Length).

getCleanAdjs([],Clean,Clean):- !.

getCleanAdjs([Adj|T],Acc,Clean):-
	(atom(Adj) ; number(Adj)),
	append(Acc,[Adj],NewAcc),
	getCleanAdjs(T,NewAcc,Clean).

getCleanAdjs(_,Clean,Clean).

	
not_member(_, []) :- !.

not_member(X, [Head|Tail]) :-
     X \= Head,
    not_member(X, Tail).
	
count(0, []).
count(Count, [Head|Tail]) :- write('Count: '), write(Count), nl, atom(Head), count(TailCount, Tail), Count is TailCount + 1.
count(_, _).