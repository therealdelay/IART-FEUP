
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
	
anos_no_seculo(Inf,Sup,Nas,Mor,0):-
	(Nas > Sup ; Inf > Mor).
	
anos_no_seculo(Inf,Sup,Nas,Mor,Anos):-
	Low is max(Inf,Nas),
	High is min(Sup,Mor),
	Anos is High - Low.
	
ano_de_morte(-1,Ano):- !,anoAtual(Ano).
ano_de_morte(Ano,Ano).

verificar_ser_seculo(Nascimento,Morte,Seculo):-
	LimiteSuperior is (Seculo * 100),
	LimiteInferior is LimiteSuperior - 99,
	ano_de_morte(Morte,MorteRes),
	anos_no_seculo(Nascimento,MorteRes,LimiteInferior,LimiteSuperior,Anos),
	Vida is MorteRes - Nascimento,
	Prop is Anos / Vida,
	Prop > 0.5.

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
	
livros_nacionalidades_existencia([Adj|T], ser, Genero, autor, existir, [L|L1]) :-
	P1 =.. [existir, LivroID, Genero, _, _, _, _, _, [Adj]],
	findall(Titulo, (P1, livro(LivroID, Titulo, _, _, _, _)), L),
	livros_nacionalidades_existencia(T, ser, Genero, autor, existir, L1).
	
livros_nacionalidades_existencia([Adj|T], ser, Genero, autor, existir, [L|L1]) :-
	P1 =.. [existir, LivroID, Genero, _, _, _, _, _, [Adj]],
	findall(Titulo, (P1, livro(LivroID, Titulo, _, _, _, _)), L),
	livros_nacionalidades_existencia(T, ser, Genero, autor, existir, L1).

autores_nacionalidades_existencia([], _, _, _, _, _, []).	
autores_nacionalidades_existencia([Adj|T], [Seculo], ser, autor, seculo, Prep, [L|L1]) :-
	P1 =.. [ser, AutID, _, _, [Adj], _, _, _],
	P2 =.. [autor, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	findall(Res, (P1, P2, (nascer(AutID, _, _, _, Prep, seculo, [Seculo]); morrer(AutID, _, _, _, Prep, seculo, [Seculo])), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	autores_nacionalidades_existencia(T, [Seculo], ser, autor, seculo, Prep, L1).

%livros mais populares de autores de multiplas nacionalidades
livros_nacionalidades_popularidade([], _, _, _, _, _, _, []).	
livros_nacionalidades_popularidade([Adj| T], [conhecido], ser, autor, livro, Adv, Prep, [L|L1]) :-
	P =.. [ser, Titulo, _, Adv, [conhecido], Prep, AutID, _],
	P1 =.. [livro, _, Titulo, Autores, _, _, _],
	P2 =.. [ser, AutID, _, _, [Adj], _, _, _],
	findall(Titulo, (P2, P1, P, member(AutID, Autores)), L),
	livros_nacionalidades_popularidade(T, [conhecido], ser, autor, livro, Adv, Prep, L1).
	
%livros de autores de multiplas nacionalidades mais recentes
livros_nacionalidade_recentes([],[]).
livros_nacionalidade_recentes([Nacionalidade|T],[L|L1]):-
	P =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P1 =.. [ser_mais_recente,Titulo,AutorId],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId)),L),
	livros_nacionalidade_recentes(T,L1).	
	
%livros de autores de multiplas nacionalidades mais antigos
livros_nacionalidade_antigos([],[]).
livros_nacionalidade_antigos([Nacionalidade|T],[L|L1]):-
	P =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P1 =.. [ser_mais_antigo,Titulo,AutorId],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId)),L),write(L),nl,
	livros_nacionalidade_antigos(T,L1).

%livros de autores de multiplas nacionalidades de um ano
livros_nacionalidades_ano([],_,_,[]).
livros_nacionalidades_ano([Nacionalidade|T],Cmp,Ano,[L|L1]):-
	P =.. [livro,_,Titulo,Autores,AnoPub,_,_],
	P1 =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,call(Cmp,AnoPub,Ano),member(AutorId,Autores),P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId )),L),
	livros_nacionalidades_ano(T,Cmp,Ano,L1).
	
%livros de autores de multiplas nacionalidades de um seculo
livros_nacionalidades_seculo([],_,_,[]).
livros_nacionalidades_seculo([Nacionalidade|T],Cmp,Seculo,[L|L1]):-
	P =.. [livro,_,Titulo,Autores,Ano,_,_],
	P1 =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,verificar_seculo(Cmp,Ano,Seculo),member(AutorId,Autores),P1,P2,(Nacionalidade == Continente ; Nacionalidade == PaisId )),L),
	livros_nacionalidades_seculo(T,Cmp,Seculo,L1).
	
%livros de um género de multiplas nacionalidades de um ano
livros_nacionalidades_existencia_ano([],_,_,_,[]).
livros_nacionalidades_existencia_ano([Nacionalidade|T],GeneroId,Cmp,Ano,[L|L1]) :-
	P =.. [livro,_,Titulo,Autores,AnoPub,Generos,_],
	P1 =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,member(GeneroId,Generos),member(AutorId,Autores),P1,P2,call(Cmp,AnoPub,Ano),(Nacionalidade == Continente ; Nacionalidade == PaisId)),L),
	livros_nacionalidades_existencia_ano(T,GeneroId,Cmp,Ano,L1).
	
%livros de um género de multiplas nacionalidades de uma seculo
livros_nacionalidades_existencia_seculo([],_,_,_,[]).
livros_nacionalidades_existencia_seculo([Nacionalidade|T],GeneroId,Cmp,Seculo,[L|L1]) :-
	P =.. [livro,_,Titulo,Autores,Ano,Generos,_],
	P1 =.. [autor,AutorId,_,_,_,_,_,PaisId,_,_],
	P2 =.. [pais,PaisId,_,Continente,_,_],
	findall(Titulo,(P,member(GeneroId,Generos),member(AutorId,Autores),P1,P2,verificar_seculo(Cmp,Ano,Seculo),(Nacionalidade == Continente ; Nacionalidade == PaisId)),L),
	livros_nacionalidades_existencia_seculo(T,GeneroId,Cmp,Seculo,L1).