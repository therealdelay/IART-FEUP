:-use_module(library(lists)).
:- dynamic adjetivo/1.

:-include('kb.pl').
:-include('lexicon.pl').
:-include('utils.pl').

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

concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2):-
	write(A),nl,
	write(S),nl,
	write(Ob),nl,
	write(Adv),nl,
	write(Adjs),nl,
	getCleanAdjs(Adjs,[],CleanAdjs),
	write(CleanAdjs),nl,
	write(Prep),nl,
	write(Ob2),nl,
	write(Adjs2),nl,
	getCleanAdjs(Adjs2,[],CleanAdjs2),
	write(CleanAdjs2),nl,
	P =.. [A,S,Ob,Adv,CleanAdjs,Prep,Ob2,CleanAdjs2],
	(P,!,write(concordo);
	write(discordo)).

	
interrogacao_opcional --> [?].
interrogacao_opcional --> [].
	
frase-->frase_declarativa.
frase-->frase_interrogatva.
%frase-->frase_conjuntiva.

frase_declarativa -->
	{write('Inicio'),nl},
	sintagma_nominal(N,S,_,_,_,_,_), !,
	{write('Sujeito'),nl},
	{length(Adjs,5),length(Adjs2,5)},
	sintagma_verbal(N,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2),
	{write('Predicado'),nl,write(Prep),nl,write(Ob2),nl},
	interrogacao_opcional,
	{write('HERE'),nl,concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2)}.
	
frase_interrogativa -->
	%{write('Start'), nl},
	sintagma_nominal_int(N-G, Q, _, _, _, _, _, _), !,
	{length(Adjs,5),length(Adjs2,5)},
	sintagma_verbal_int(N-G, Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2),
	[?],
	{resposta(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2)}.
	
%%%%%%%%%%%%%%%%%%%%%%%%%
% FRASES INTERROGATIVAS %
%%%%%%%%%%%%%%%%%%%%%%%%%

sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2) -->
	sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2),
	sintagma_preposicional_int(Prep, Ob2, Adjs2).

sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2) -->
	sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2).

sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2) -->
	sintagma_nominal_int_aux2(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2),
	sintagma_adjetival_int(N-G, Adv, Adjs).
	
sintagma_nominal_int_aux(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2) -->
	sintagma_nominal_int_aux2(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2).

sintagma_nominal_int_aux2(N-G, Q, Ob, _, _, _, _, _) --> 
	pron_int(N-G, Q), art_indef(N-G), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, Q, Ob, _, _, _, _, _) -->
	pron_int(N-G, Q), art_def(N-G), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, Q, Ob, _, _, _, _, _) -->
	pron_int(N-G, Q), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, Q, _, _, _, _, _, _) -->
	pron_int(N-G, Q).
	
sintagma_nominal_int_aux2(N-G, _, Ob, _, _, _, _, _) --> 
	art_indef(N-G), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, _, Ob, _, _, _, _, _) -->
	art_def(N-G), nome(N-G, Ob).
	
sintagma_nominal_int_aux2(N-G, _, Ob, _, _, _, _, _) -->
	nome(N-G,Ob).
	
sintagma_nominal_int_aux2(_, _, Ob, _, _, _, _, _) -->
	[Titulo],
	{livro(_, Titulo, _, _, _, _),
	Ob = Titulo}.
	
sintagma_nominal_int_aux2(_,_,_,_,_,_,_,_) --> 	[].
	
sintagma_preposicional_int(Prep, Ob, Adjs) -->
	preposicao(N-G, Prep),
	sintagma_nominal_int(N-G, _, Ob, _, Adjs, _, _, _).
	
sintagma_adjetival_int(N-G, Adv, Adjs) -->
	%{write('sintagma adjectival'), nl},
	sintagma_adjetival_int_aux(N-G, Adv, Adjs).
	
%sintagma_adjetival_int(N-G, Adv, Adjs) -->
%	sintagma_adjetival_int_aux(N-G, Adv, Adjs), [e], sintagma_adjetival_int(N-G, Adv, Adjs),
%	{write(Adjs), nl}.
	
sintagma_adjetival_int(_, _, _) -->
	[].
	
sintagma_adjetival_int_aux(N-G, _, Adjs) -->
	adjetivo(N-G, Adj),
	[e],
	adjetivo(N-G, Adj2),
	{actual_length(Adjs,0,Length), nth0(Length,Adjs,Adj), Lengthaux is Length + 1, nth0(Lengthaux, Adjs, Adj2)}.
	
sintagma_adjetival_int_aux(N-G, _, Adjs) -->
	adjetivo(N-G, Adj),
	{actual_length(Adjs,0,Length), nth0(Length,Adjs,Adj)}.
	%{count(Length, Adjs), nth0(Length, Adjs, Adj)}.
	
sintagma_adjetival_int_aux(N-G, Adv, Adjs) -->
	adverbio(Adv),
	adjetivo(N-G, Adj),
	{actual_length(Adjs,0,Length), nth0(Length,Adjs,Adj)}.
	%{count(Length, Adjs), nth0(Length, Adjs, Adj)}.

sintagma_verbal_int(N-G, Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2) -->
	verbo(N, A, _),
	sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2).
	
resposta(Q, A, Ob, _, _, _, _, _) :-
	resposta_escrever(Q, A, Ob).
	
resposta(Q, A, Ob, _, Adjs, _, Ob2, _) :-
	var(Ob2),
	resposta_nacionalidade(Q, A, Ob, Adjs).
	
resposta(Q, A, Ob, _, Adjs, Prep, Ob2, Adjs2) :-
	nonvar(Ob2),
	resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2).
	
resposta(Q, A, _, _, _, Prep, Ob2, Adjs2) :-
	resposta_nascimento(Q, A, Prep, Ob2, Adjs2).
	
resposta(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2) :-
	write('Q: '), write(Q), nl,
	write('A: '), write(A), nl,
	write('Ob: '), write(Ob), nl,
	write('Adv: '), write(Adv), nl,
	write('Adjs: '), write(Adjs), nl,
	write('Prep: '), write(Prep), nl,
	write('Ob2: '), write(Ob2), nl,
	write('Adjs2: '), write(Adjs2), nl.
	
%still not formatted
resposta_escrever(Q, A, Ob) :-
	A == escrever,
	P =.. [A, AutID, Ob, _, _, _, _, _],
	findall(Primeiro-Ultimo, (P, autor(AutID, Primeiro, Ultimo, _, _, _, _, _, _)), L),
	(Q==ql, write(L); 
	length(L,N),write(N)).
	
%frase_interrogativa(['quais','sao','os','escritores','portugueses','e','europeus','do','seculo','XIX','?'],[]).
resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2) :-
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
	
	findall(Primeiro-Ultimo, ((P; P1), P2, (nascer(AutID, _, _, _, Prep, Ob2, CleanAdjs2); morrer(AutID, _, _, _, Prep, Ob2, CleanAdjs2))), L), sort(L, L1),
	(Q==ql, write(L1); 
	length(L1,N),write(N)).
	
%frase_interrogativa(['quais','sao','os','escritores','portugueses','do','seculo','XIX','?'],[]).
resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2) :-
	A == ser, Ob == autor, Ob2 == seculo,
	getCleanAdjs(Adjs,[],CleanAdjs),
	getCleanAdjs(Adjs2, [], CleanAdjs2),
	
	length(CleanAdjs, 1), !,
	
	P =.. [A, AutID, _, _, CleanAdjs, _, _, _],
	P2 =.. [Ob, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	
	findall(Primeiro-Ultimo, (P, P2, (nascer(AutID, _, _, _, Prep, Ob2, CleanAdjs2); morrer(AutID, _, _, _, Prep, Ob2, CleanAdjs2))), L),
	sort(L, L1),
	(Q==ql, write(L1); 
	length(L1,N),write(N)).

%frase_interrogativa(['quais','sao','os','escritores','portugueses','e','europeus','?'],[]).
resposta_nacionalidade(Q, A, Ob, Adjs) :-
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
	
	findall(Primeiro-Ultimo, ((P; P1), P2), L), sort(L, L1),
	(Q==ql, write(L1); 
	length(L1,N),write(N)).

%frase_interrogativa(['quais','sao','os','escritores','portugueses','?'],[]).	
resposta_nacionalidade(Q, A, Ob, Adjs) :-
	A == ser,
	Ob == autor,
	getCleanAdjs(Adjs,[],CleanAdjs),
	
	length(CleanAdjs, 1), !,
	
	P =.. [A, AutID, _, _, CleanAdjs, _, _, _],
	P2 =.. [Ob, AutID, Primeiro, Ultimo, _, _, _, _, _, _],
	
	findall(Primeiro-Ultimo, (P, P2), L), 
	(Q==ql, write(L); 
	length(L,N),write(N)).
	
resposta_nascimento(Q, A, Prep, Ob2, Adjs2) :-
	A == nascer; A == morrer,
	getCleanAdjs(Adjs2, [], CleanAdjs),
	P =.. [A, AutID, _, _, _, Prep, Ob2, CleanAdjs],
	findall(Primeiro-Ultimo, (P, autor(AutID, Primeiro, Ultimo, _, _, _, _, _, _)), L),
	(Q==ql, write(L); 
	length(L,N),write(N)).
	
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
	