
verificar_seculo(=, Ano, Seculo):-
	LimiteSuperior is (Seculo * 100),
	LimiteInferior is LimiteSuperior - 99,
	Ano >= LimiteInferior,
	Ano =< LimiteSuperior.

verificar_seculo(<, Ano, Seculo):-
	LimiteSuperior is (Seculo * 100),
	LimiteInferior is LimiteSuperior - 99,
	Ano < LimiteInferior.

verificar_seculo(>, Ano, Seculo):-
	LimiteSuperior is (Seculo * 100),
Ano > LimiteSuperior.

ser_mais_recente(Titulo,AutorId):-
	livro_mais_recente(AutorId,MaxIdade),
	livro(_,Titulo,_,Idade,_,_),
	Idade == MaxIdade.
	
ser_mais_antigo(Titulo,AutorId):-
	livro_mais_antigo(AutorId,MinIdade),
	livro(_,Titulo,_,Idade,_,_),
	Idade == MinIdade.

livro_mais_recente(AutorId, MaxIdade):-
	findall(Idade, (livro(_,_,Autores,Idade,_,_),member(AutorId, Autores)), Idades),
	max_list(Idades,MaxIdade).

livro_mais_antigo(AutorId, MinIdade):-
	findall(Idade, (livro(_,_,Autores,Idade,_,_),member(AutorId, Autores)), Idades),
	min_list(Idades,MinIdade).

getHighestPop(AutorId, MaxPop):-
	findall(LivroPop, (livro(_,_,Autores,_,_,LivroPop),member(AutorId, Autores)), Pops),
	max_list(Pops,MaxPop).
	
getLowestPop(AutorId, MinPop):-
	findall(LivroPop, (livro(_,_,Autores,_,_,LivroPop),member(AutorId, Autores)), Pops),
	min_list(Pops,MinPop).

%autores de multiplas nacionalidades
autores_nacionalidades([], _, _, []).
autores_nacionalidades([Adj|T], ser, autor, [L|L1]) :-
	P1 =.. [ser, AutID, _, _, [Adj], _, _, _],
	P2 =.. [autor, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	findall(Res, (P1, P2, atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	autores_nacionalidades(T, ser, autor, L1).

%livros existentes de autores de multiplas nacionalidades
livros_nacionalidades_existencia([], _, _, _, _, []).
livros_nacionalidades_existencia([Adj|T], ser, livro, autor, existir, [L|L1]) :-
	P1 =.. [existir, LivroID, _, _, _, _, _, _, [Adj]],
	P2 =.. [livro, LivroID, Titulo, _, _, _, _],
	findall(Titulo, (P1, P2), L),
	livros_nacionalidades_existencia(T, ser, livro, autor, existir, L1).

%multiple_adjs_solver([], _, _, _, _, _, []).	
%multiple_adjs_solver([Adj|T], [Seculo], ser, autor, seculo, Prep, [L|L1]) :-
%	P1 =.. [ser, AutID, _, _, [Adj], _, _, _],
%	P2 =.. [autor, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
%	findall(Res, (P1, P2, (nascer(AutID, _, _, _, Prep, seculo, [Seculo]); morrer(AutID, _, _, _, Prep, seculo, [Seculo])), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
%	multiple_adjs_solver(T, [Seculo], ser, autor, seculo, Prep, L1).

%livros mais populares de autores de multiplas nacionalidades
livros_nacionalidades_popularidade([], _, _, _, _, _, _, []).	
livros_nacionalidades_popularidade([Adj| T], [conhecido], ser, autor, livro, Adv, Prep, [L|L1]) :-
	P =.. [ser, Titulo, _, Adv, [conhecido], Prep, AutID, _],
	P1 =.. [livro, _, Titulo, Autores, _, _, _],
	P2 =.. [ser, AutID, _, _, [Adj], _, _, _],
	findall(Titulo, (P2, P1, P, member(AutID, Autores)), L),
	livros_nacionalidades_popularidade(T, [conhecido], ser, autor, livro, Adv, Prep, L1).
	
%livros de autores de multiplas nacionalidades mais recentes
livros_nacionalidade_antigos([],[]).
livros_nacionalidade_antigos([Nacionalidade|T],[L|L1]):-
	P =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P1 =.. [ser_mais_recente,Titulo,AutorId],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId)),L),
	livros_nacionalidade_antigos(T,L1).	
	
%livros de autores de multiplas nacionalidades mais antigos
livros_nacionalidade_antigos([],[]).
livros_nacionalidade_antigos([Nacionalidade|T],[L|L1]):-
	P =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P1 =.. [ser_mais_antigo,Titulo,AutorId],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId)),L),write(L),nl,
	livros_nacionalidade_antigos(T,L1).

%livros de autores de multiplas nacionalidades de uma data
livros_nacionalidades_data([],_,_,[]).
livros_nacionalidades_data([Nacionalidade|T],Cmp,Seculo,[L|L1]):-
	P =.. [livro,_,Titulo,Autores,Ano,_,_],
	P1 =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,verificar_seculo(Cmp,Ano,Seculo),member(AutorId,Autores),P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId )),L),
	livros_nacionalidades_data(T,Cmp,Seculo,L1).