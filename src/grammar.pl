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
	(P,!,write(concordo),
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
	{write('Start'), nl},
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
	{livro(_, Titulo, _, _, _),
	Ob = Titulo}.
	
sintagma_preposicional_int(Prep, Ob, Adjs) -->
	%{write('sintagma preposicional'), nl},
	preposicao(N-G, Prep),
	sintagma_nominal_int(N-G, _, Ob, _, Adjs, _, _, _).
	
sintagma_adjetival_int(N-G, Adv, Adjs) -->
	%{write('sintagma adjectival'), nl},
	sintagma_adjetival_int_aux(N-G, Adv, Adjs).
	
sintagma_adjetival_int(N-G, Adv, Adjs) -->
	sintagma_adjetival_int_aux(N-G, Adv, Adjs), [e].
	
sintagma_adjetival_int(_, _, _) -->
	[].
	
sintagma_adjetival_int_aux(N-G, _, Adjs) -->
	adjetivo(N-G, Adj),
	{actual_length(Adjs,0,Length),nth0(Length,Adjs,Adj)}.
	
sintagma_adjetival_int_aux(N-G, Adv, [_|T]) -->
	adverbio(Adv),
	adjetivo(N-G, T).

sintagma_verbal_int(N-G, Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2) -->
	verbo(N, A, _),
	sintagma_nominal_int(N-G, Q, Ob, Adv, Adjs, Prep, Ob2, Adjs2).
	
resposta(Q, A, Ob, _, _, _, _, _) :-
	resposta_escrever(Q, A, Ob).
	
resposta(Q, A, Ob, _, Adjs, _, _, _) :-
	resposta_nacionalidade(Q, A, Ob, Adjs).
	
%still not formatted
resposta_escrever(Q, A, Ob) :-
	A == escrever,
	P =.. [A, AutID, Ob, _, _, _, _, _],
	findall(Primeiro-Ultimo, (P, autor(AutID, Primeiro, Ultimo, _, _, _, _, _, _)), L),
	(Q==ql, write(L); 
	length(L,N),write(N)).
	
resposta_nacionalidade(Q, A, Ob, Adjs) :-
	%trace,
	A == ser,
	Ob == autor,
	P =.. [A, AutID, _, _, Adjs, _, _, _],
	%devia ser findall(AutID, (P, autor(AutID, Primeiro, Ultimo, _, _, _, _, _, _)), L), mas há algum problema com o predicado 'ser', por isso deixo assim para responder alguma coisa
	findall(AutID, P, L), 
	(Q==ql, write(L); 
	length(L,N),write(N)).
	%notrace.
	

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
	{livro(_,Titulo,_,_,_),
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
	%{write('Prep: '),write(Prep)},
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
	
sintagma_adjetival_aux(N-G,Adv,[_|T]) -->
	adverbio(Adv), adjetivo(N-G,T).
	
sintagma_verbal(N,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	verbo(N,A,_),
	sintagma_nominal(N,Ob,Adv,Adjs,Prep,Ob2,Adjs2).
	
%sintagma_verbal(_,A,Adv,Adjs,Prep,Ob2) --> 
	%sintagma_nominal.

%frase_conjuntiva -->
	%[e].
	