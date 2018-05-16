:-use_module(library(lists)).
:- dynamic adjetivo/1.

:-include('kb.pl').
:-include('lexicon.pl').
:-include('utils.pl').
:-include('ui.pl').

procurar_autor(AutorId, Prim, Ultim, Nasc, Morte, Sexo, Nacionalidade, Pseudonimos)-->
	[Prim],[Ultim],
	autor(AutorId, Prim, Ultim, Nasc, Morte, Sexo, Nacionalidade, Pseudonimos).


expr_ano(Comparador, Ano) -->
	expr_ano1(Comparador),
	[AnoAtom], {write(AnoAtom),atom_int(AnoAtom,Ano)}.

expr_ano1(=) --> [em].
expr_ano1(=) --> [no], expr_ano2.
expr_ano1(<) --> [antes], expr_ano4.
expr_ano1(>) --> [depois], expr_ano4.
expr_ano2 --> [ano], expr_ano3.
expr_ano3 --> [de].
expr_ano3 --> [].
expr_ano4 --> [do], [ano], expr_ano3.
expr_ano4 --> expr_ano3.

expr_seculo(Comparador,Seculo)-->
	expr_seculo1(Comparador),
	[seculo], [SeculoAtom],
	{seculo(SeculoAtom,Seculo)}.

expr_seculo1(<) --> [antes], [do].
expr_seculo1(>) --> [depois], [do].
expr_seculo1(=) --> [no].

%%%%%%%%%%%%%%%%%%
%% VERIFICACOES %%
%%%%%%%%%%%%%%%%%%

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
	
verificar_genero(Titulo,Genero):-
	genero(Genero_id,Genero),!,
	livro(_,Titulo,_,_,Generos_ids),
	member(Genero_id,Generos_ids).

concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2,Resposta):-
	% write(A),nl,
	% write(S),nl,
	% write(Ob),nl,
	% write(Adv),nl,
	% write(Adjs),nl,
	getCleanAdjs(Adjs,[],CleanAdjs),
	% write(CleanAdjs),nl,
	% write(Prep),nl,
	% write(Ob2),nl,
	% write(Adjs2),nl,
	getCleanAdjs(Adjs2,[],CleanAdjs2),
	% write(CleanAdjs2),nl,
	P =.. [A,S,Ob,Adv,CleanAdjs,Prep,Ob2,CleanAdjs2],
	(P,!,Resposta=concordo;
	Resposta=discordo).

	
interrogacao_opcional --> [?].
interrogacao_opcional --> [.].
	
frase(Resposta)-->frase_declarativa(Resposta).
frase(Resposta)-->frase_interrogativa(Resposta).
%frase-->frase_conjuntiva.

frase_declarativa(Resposta) -->
	%{write('Inicio'),nl},
	sintagma_nominal(N,S,_,_,_,_,_), !,
	%{write('Sujeito'),nl},
	{length(Adjs,5),length(Adjs2,5)},
	sintagma_verbal(N,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2),
	%{write('Predicado'),nl,write(Prep),nl,write(Ob2),nl},
	interrogacao_opcional,
	%write('HERE'),nl,
	{concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2,Resposta)}.
	
frase_interrogativa(Resposta) -->
	%{write('Start'), nl},
	{length(Adjs,5),length(Adjs2,5),length(Adjs3,5)},
	sintagma_nominal_int(N-G, Q, _, _, _, _, _, _, Ob3, Adjs3), !,
	sintagma_verbal_int(N-G, Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, _),
	[?],
	{resposta(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3, Resposta)}.

%%%%%%%%%%%%%%%%%%%%%%%%%
% FRASES INTERROGATIVAS %
%%%%%%%%%%%%%%%%%%%%%%%%%

sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3) -->
	sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3),
	sintagma_preposicional_int(Prep, Ob2, Adjs2, Ob3, Adjs3).

sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3) -->
	sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3).

sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3) -->
	sintagma_nominal_int_aux2(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3),
	sintagma_adjetival_int(N-G, Adv, Adjs, Ob3, Adjs3).
	
sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3) -->
	sintagma_nominal_int_aux2(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3).

sintagma_nominal_int_aux2(N-G, Q, _, _, _, _, _, _, Ob3, _) --> 
	pron_int(N-G, Q), art_indef(N-G), nome(N-G, Ob3).
	
sintagma_nominal_int_aux2(N-G, Q, _, _, _, _, _, _, Ob3, _) -->
	pron_int(N-G, Q), art_def(N-G), nome(N-G, Ob3).
	
sintagma_nominal_int_aux2(N-G, Q, _, _, _, _, _, _, Ob3, _) -->
	pron_int(N-G, Q), nome(N-G, Ob3).
	
sintagma_nominal_int_aux2(N-G, Q, _, _, _, _, _, _, _, _) -->
	pron_int(N-G, Q).
	
sintagma_nominal_int_aux2(N-G, _, Ob, _, _, _, _, _, _, _) --> 
	art_indef(N-G), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, _, Ob, _, _, _, _, _, _, _) -->
	art_def(N-G), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, _, Ob, _, _, _, _, _, _, _) -->
	nome(N-G,Ob).
	
sintagma_nominal_int_aux2(_, _, Ob, _, _, _, _, _, _, _) -->
	[Titulo],
	{livro(_, Titulo, _, _, _, _),
	Ob = Titulo}.
	
sintagma_nominal_int_aux2(_,_,_,_,_,_,_,_,_,_) --> 	[].
	
sintagma_preposicional_int(Prep, Ob, Adjs, Ob3, _) -->
	{var(Ob3)},
	preposicao(N-G, Prep),
	sintagma_nominal_int(N-G, _, Ob, _, Adjs, _, _, _, _, _).
	
sintagma_preposicional_int(Prep, _, _, Ob3, Adjs3) -->
	{nonvar(Ob3)},
	preposicao(N-G, Prep),
	sintagma_nominal_int(N-G, _, _, _, _, _, _, _, Ob3, Adjs3).
	
sintagma_adjetival_int(N-G, Adv, Adjs, Ob3, Adjs3) -->
	%{write('sintagma adjectival'), nl},
	sintagma_adjetival_int_aux(N-G, Adv, Adjs, Ob3, Adjs3).
	
%sintagma_adjetival_int(N-G, Adv, Adjs) -->
%	sintagma_adjetival_int_aux(N-G, Adv, Adjs), [e], sintagma_adjetival_int(N-G, Adv, Adjs),
%	{write(Adjs), nl}.
	
sintagma_adjetival_int(_, _, _, _, _) -->
	[].
	
sintagma_adjetival_int_aux(N-G, _, Adjs, Ob3, _) -->
	{var(Ob3)},
	adjetivo(N-G, Adj),
	[e],
	adjetivo(N-G, Adj2),
	{actual_length(Adjs,0,Length), nth0(Length,Adjs,Adj), Lengthaux is Length + 1, nth0(Lengthaux, Adjs, Adj2)}.
	
sintagma_adjetival_int_aux(N-G, _, _, Ob3, Adjs3) -->
	{nonvar(Ob3)},
	adjetivo(N-G, Adj),
	[e],
	adjetivo(N-G, Adj2),
	{actual_length(Adjs3,0,Length), nth0(Length,Adjs3,Adj), Lengthaux is Length + 1, nth0(Lengthaux, Adjs3, Adj2)}.
	
sintagma_adjetival_int_aux(N-G, _, Adjs, Ob3, _) -->
	{var(Ob3)},
	adjetivo(N-G, Adj),
	{actual_length(Adjs,0,Length), nth0(Length,Adjs,Adj)}.
	%{count(Length, Adjs), nth0(Length, Adjs, Adj)}.
	
sintagma_adjetival_int_aux(N-G, _, _, Ob3, Adjs3) -->
	{nonvar(Ob3)},
	adjetivo(N-G, Adj),
	{actual_length(Adjs3,0,Length), nth0(Length,Adjs3,Adj)}.
	%{count(Length, Adjs), nth0(Length, Adjs, Adj)}.
	
sintagma_adjetival_int_aux(N-G, Adv, Adjs, Ob3, _) -->
	{var(Ob3)},
	adverbio(Adv),
	adjetivo(N-G, Adj),
	{actual_length(Adjs,0,Length), nth0(Length,Adjs,Adj)}.
	%{count(Length, Adjs), nth0(Length, Adjs, Adj)}.

sintagma_adjetival_int_aux(N-G, Adv, _, Ob3, Adjs3) -->
	{nonvar(Ob3)},
	adverbio(Adv),
	adjetivo(N-G, Adj),
	{actual_length(Adjs3,0,Length), nth0(Length,Adjs3,Adj)}.
	%{count(Length, Adjs), nth0(Length, Adjs, Adj)}.	

sintagma_verbal_int(N-G, Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3) -->
	{nonvar(Ob3), Q = ql},
	[que],
	verbo(N, A, _),
	sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3).
	
sintagma_verbal_int(N-G, Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3) -->
	{var(Ob3)},
	verbo(N, A, _),
	sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3).
	
resposta(Q, A, Ob, _, _, _, _, _, _, _, Resposta) :-
	%write('Q: '), write(Q), nl,
	%write('A: '), write(A), nl,
	%write('Ob: '), write(Ob), nl,
	%write('Adv: '), write(Adv), nl,
	%write('Adjs: '), write(Adjs), nl,
	%write('Prep: '), write(Prep), nl,
	%write('Ob2: '), write(Ob2), nl,
	%write('Adjs2: '), write(Adjs2), nl,
	%write('Ob3: '), write(Ob3), nl,
	%write('Adjs3: '), write(Adjs3), nl,
	resposta_escrever(Q, A, Ob, Resposta).
	
resposta(Q, A, Ob, _, Adjs, _, Ob2, _, _, _, Resposta) :-
	%write('Q: '), write(Q), nl,
	%write('A: '), write(A), nl,
	%write('Ob: '), write(Ob), nl,
	%write('Adv: '), write(Adv), nl,
	%write('Adjs: '), write(Adjs), nl,
	%write('Prep: '), write(Prep), nl,
	%write('Ob2: '), write(Ob2), nl,
	%write('Adjs2: '), write(Adjs2), nl,
	%write('Ob3: '), write(Ob3), nl,
	%write('Adjs3: '), write(Adjs3), nl,
	var(Ob2),
	resposta_nacionalidade(Q, A, Ob, Adjs, Resposta).
	
resposta(Q, A, Ob, _, Adjs, Prep, Ob2, Adjs2, _, _, Resposta) :-
	%write('Q: '), write(Q), nl,
	%write('A: '), write(A), nl,
	%write('Ob: '), write(Ob), nl,
	%write('Adv: '), write(Adv), nl,
	%write('Adjs: '), write(Adjs), nl,
	%write('Prep: '), write(Prep), nl,
	%write('Ob2: '), write(Ob2), nl,
	%write('Adjs2: '), write(Adjs2), nl,
	%write('Ob3: '), write(Ob3), nl,
	%write('Adjs3: '), write(Adjs3), nl,
	nonvar(Ob2),
	resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2, Resposta).
	
resposta(Q, A, _, _, _, Prep, Ob2, Adjs2, _, _, Resposta) :-
	%write('Q: '), write(Q), nl,
	%write('A: '), write(A), nl,
	%write('Ob: '), write(Ob), nl,
	%write('Adv: '), write(Adv), nl,
	%write('Adjs: '), write(Adjs), nl,
	%write('Prep: '), write(Prep), nl,
	%write('Ob2: '), write(Ob2), nl,
	%write('Adjs2: '), write(Adjs2), nl,
	%write('Ob3: '), write(Ob3), nl,
	%write('Adjs3: '), write(Adjs3), nl,
	resposta_nascimento(Q, A, Prep, Ob2, Adjs2, Resposta).
	
resposta(Q, A, _, _, _, _, _, _, Ob3, Adjs3, Resposta) :-
	%write('Q: '), write(Q), nl,
	%write('A: '), write(A), nl,
	%write('Ob: '), write(Ob), nl,
	%write('Adv: '), write(Adv), nl,
	%write('Adjs: '), write(Adjs), nl,
	%write('Prep: '), write(Prep), nl,
	%write('Ob2: '), write(Ob2), nl,
	%write('Adjs2: '), write(Adjs2), nl,
	%write('Ob3: '), write(Ob3), nl,
	%write('Adjs3: '), write(Adjs3), nl,
	resposta_existencia_livros(Q, A, Ob3, Adjs3, Resposta).
	
resposta(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3, _) :-
	write('Q: '), write(Q), nl,
	write('A: '), write(A), nl,
	write('Ob: '), write(Ob), nl,
	write('Adv: '), write(Adv), nl,
	write('Adjs: '), write(Adjs), nl,
	write('Prep: '), write(Prep), nl,
	write('Ob2: '), write(Ob2), nl,
	write('Adjs2: '), write(Adjs2), nl,
	write('Ob3: '), write(Ob3), nl,
	write('Adjs3: '), write(Adjs3), nl.
	
%still not formatted
resposta_escrever(Q, A, Ob, Resposta) :-
	A == escrever,
	P =.. [A, AutID, Ob, _, _, _, _, _],
	findall(Res, (P, autor(AutID, Primeiro, Ultimo, _, _, _, _, _, _), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	(Q==ql, atomic_list_concat(L, ',', Resposta); 
	length(L,Resposta)).
	
%frase_interrogativa(['quais','sao','os','escritores','portugueses','e','europeus','do','seculo','XIX','?'],[]).
resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2, Resposta) :-
	A == ser, Ob == autor, Ob2 == seculo,
	getCleanAdjs(Adjs,[],CleanAdjs),
	getCleanAdjs(Adjs2, [], CleanAdjs2),
	length(CleanAdjs, Length),
	Length > 1, !,
	
	nth0(0, CleanAdjs, Elem1),
	nth0(1, CleanAdjs, Elem2),
	Clean1 = [Elem1], Clean2 = [Elem2],
	
	P =.. [A, AutID, _, _, Clean1, _, _, _],
	P1 =.. [A, AutID, _, _, Clean2, _, _, _],
	P2 =.. [Ob, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	
	findall(Res, ((P; P1), P2, (nascer(AutID, _, _, _, Prep, Ob2, CleanAdjs2); morrer(AutID, _, _, _, Prep, Ob2, CleanAdjs2)), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L), sort(L, L1),
	(Q==ql, atomic_list_concat(L1, ',', Resposta); 
	length(L1,Resposta)).
	
%frase_interrogativa(['quais','sao','os','escritores','portugueses','do','seculo','XIX','?'],[]).
resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2, Resposta) :-
	A == ser, Ob == autor, Ob2 == seculo,
	getCleanAdjs(Adjs,[],CleanAdjs),
	getCleanAdjs(Adjs2, [], CleanAdjs2),
	
	length(CleanAdjs, 1), !,
	
	P =.. [A, AutID, _, _, CleanAdjs, _, _, _],
	P2 =.. [Ob, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	
	findall(Res, (P, P2, (nascer(AutID, _, _, _, Prep, Ob2, CleanAdjs2); morrer(AutID, _, _, _, Prep, Ob2, CleanAdjs2)), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	sort(L, L1),
	(Q==ql, atomic_list_concat(L1, ',', Resposta); 
	length(L1,Resposta)).

%frase_interrogativa(['quais','sao','os','escritores','portugueses','e','europeus','?'],[]).
resposta_nacionalidade(Q, A, Ob, Adjs, Resposta) :-
	A == ser,
	Ob == autor,
	getCleanAdjs(Adjs,[],CleanAdjs),
	length(CleanAdjs, Length),
	Length > 1, !,
	
	nth0(0, CleanAdjs, Elem1),
	nth0(1, CleanAdjs, Elem2),
	Clean1 = [Elem1], Clean2 = [Elem2],
	
	P =.. [A, AutID, _, _, Clean1, _, _, _],
	P1 =.. [A, AutID, _, _, Clean2, _, _, _],
	P2 =.. [Ob, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	
	findall(Res, ((P; P1), P2, atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L), sort(L, L1),
	(Q==ql, atomic_list_concat(L1, ',', Resposta); 
	length(L1,Resposta)).

%frase_interrogativa(['quais','sao','os','escritores','portugueses','?'],[]).	
resposta_nacionalidade(Q, A, Ob, Adjs, Resposta) :-
	A == ser,
	Ob == autor,
	getCleanAdjs(Adjs,[],CleanAdjs),
	
	length(CleanAdjs, 1), !,
	
	P =.. [A, AutID, _, _, CleanAdjs, _, _, _],
	P2 =.. [Ob, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	
	findall(Res, (P, P2, atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L), 
	(Q==ql, atomic_list_concat(L, ',', Resposta); 
	length(L,Resposta)).
	
resposta_nascimento(Q, A, Prep, Ob2, Adjs2, Resposta) :-
	(A == nascer; A == morrer),
	getCleanAdjs(Adjs2, [], CleanAdjs),
	P =.. [A, AutID, _, _, _, Prep, Ob2, CleanAdjs],
	findall(Res, (P, autor(AutID, Primeiro, Ultimo, _, _, _, _, _, _), atomic_concat(Primeiro, ' ', Aux), atomic_concat(Aux, Ultimo, Res)), L),
	(Q==ql, atomic_list_concat(L, ',', Resposta); 
	length(L,Resposta)).
	
%falta limitar em casos de '...apos o sec XIX'	
resposta_existencia_livros(Q, A, Ob3, Adjs3, Resposta) :-
	A == existir, Ob3 == livro,
	getCleanAdjs(Adjs3, [], CleanAdjs),
	length(CleanAdjs, Length),
	Length > 1, !,
	
	nth0(0, CleanAdjs, Elem1),
	nth0(1, CleanAdjs, Elem2),
	Clean1 = [Elem1], Clean2 = [Elem2],
	
	P =.. [Ob3, LivroId, _, Autores, _, _, _],
	findall(Titulo, (P, (ser(AutID, _, _, Clean1, _, _, _) ; ser(AutID, _, _, Clean2, _, _, _)), member(AutID, Autores), livro(LivroId, Titulo, _, _, _, _)), L),
	(Q==ql, atomic_list_concat(L, ',', Resposta); 
	length(L,Resposta)).

%falta limitar em casos de '...apos o sec XIX'		
resposta_existencia_livros(Q, A, Ob3, Adjs3, Resposta) :-
	A == existir, Ob3 == livro,
	getCleanAdjs(Adjs3, [], CleanAdjs),
	
	length(CleanAdjs, 1), !,
	
	P =.. [Ob3, LivroId, _, Autores, _, _, _],
	findall(Titulo, (P, ser(AutID, _, _, CleanAdjs, _, _, _), member(AutID, Autores), livro(LivroId, Titulo, _, _, _, _)), L),
	(Q==ql, atomic_list_concat(L, ',', Resposta); 
	length(L,Resposta)).	

%%%%%%%%%%%%%%%%%%%%%%%
% FRASES DECLARATIVAS %
%%%%%%%%%%%%%%%%%%%%%%%
	
sintagma_nominal(N,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	sintagma_nominal_aux(N,Ob,Adv,Adjs,Prep,Ob2,Adjs2).
	
sintagma_nominal_aux(N,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	sintagma_nominal_aux2(N,Ob,Adv,Adjs,Prep,Ob2),
	sintagma_preposicional(Prep,Ob2,Adjs2).
	
sintagma_nominal_aux(N,Ob,Adv,Adjs,Prep,Ob2,_) --> 
	sintagma_nominal_aux2(N,Ob,Adv,Adjs,Prep,Ob2).

sintagma_nominal_aux2(N,Ob,Adv,Adjs,Prep,Ob2) -->
	sintagma_nominal_aux3(N-G,Ob,Adv,Adjs,Prep,Ob2),
	sintagma_adjetival(N-G,Adv,Adjs).
	
sintagma_nominal_aux2(N,Ob,Adv,Adjs,Prep,Ob2) -->
	sintagma_nominal_aux3(N-_,Ob,Adv,Adjs,Prep,Ob2).
		
sintagma_nominal_aux3(N-G,Ob,_,_,_,_) --> 
	art_indef(N-G), nome(N-G, Ob).
	
sintagma_nominal_aux3(N-G,Ob,_,_,_,_) -->
	art_def(N-G), nome(N-G, Ob).
	
sintagma_nominal_aux3(N-G,Ob,_,_,_,_) -->
	nome(N-G,Ob).
	
sintagma_nominal_aux3(N-_,Ob,_,_,_,_) -->
	%{write('Titulo'),nl},
	[Titulo],
	{livro(_,Titulo,_,_,_,_),
	N=s, Ob = Titulo}.

sintagma_nominal_aux3(N-_,Ob,_,_,_,_) -->
	[Primeiro],[Ultimo],
	{autor(AutorId,Primeiro,Ultimo,_,_,_,_,_,_),
	N=s, Ob=AutorId}.
	
sintagma_nominal_aux3(N-_,Ob,_,_,_,_) -->
	%{write('Autor Primeiro'),nl},
	[Primeiro],
	{autor(AutorId,Primeiro,_,_,_,_,_,_,_),
	N=s, Ob=AutorId}.
	
sintagma_nominal_aux3(N-_,Ob,_,_,_,_) -->
	[Ultimo],
	{autor(AutorId,_,Ultimo,_,_,_,_,_,_),
	N=s, Ob=AutorId}.
		
sintagma_nominal_aux3(N-_,Ob,_,_,_,_) -->
	%{write('Heteronimo'),nl},
	[Heteronimo],
	%{write(Heteronimo),nl},
	{autor(AutorId,_,_,_,_,_,_,_,Heteronimos), member(Heteronimo, Heteronimos), !,
	N=s, Ob=AutorId}.
	
sintagma_nominal_aux3(_,_,_,_,_,_) --> 	[].

sintagma_preposicional(Prep,Ob,Adjs) -->
	preposicao(N-_,Prep),
	{write('Prep: '),write(Prep)},
	sintagma_nominal(N,Ob,_,Adjs,_,_,_).
	%{write(Ob),nl}.
	
sintagma_adjetival(N-G,Adv,Ajs) -->
	sintagma_adjetival_aux(N-G,Adv,Ajs).
	
sintagma_adjetival(N-G,Adv,Ajs) --> 
	sintagma_adjetival_aux(N-G,Adv,Ajs), [e].

sintagma_adjetival(_,_,_) --> [].

sintagma_adjetival_aux(N-G,_,Adjs) --> 
	adjetivo(N-G,Adj),
	{actual_length(Adjs,0,Length),nth0(Length,Adjs,Adj)}.
	
sintagma_adjetival_aux(N-G,Adv,Adjs) -->
	adverbio(Adv), adjetivo(N-G,Adj),
	{actual_length(Adjs,0,Length),nth0(Length,Adjs,Adj)}.
	
sintagma_verbal(N,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	verbo(N,A,_),
	sintagma_nominal(N,Ob,Adv,Adjs,Prep,Ob2,Adjs2).
	
%sintagma_verbal(_,A,Adv,Adjs,Prep,Ob2) --> 
	%sintagma_nominal.

%frase_conjuntiva -->
	%[e].
	