:-use_module(library(lists)).

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

concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2):-
	write(A),nl,
	write(S),nl,
	write(Ob),nl,
	write(Adv),nl,
	write(Adjs),nl,
	write(Prep),nl,
	write(Ob2),nl,
	P =.. [A,S,Ob,Adv,Adjs,Prep,Ob2],
	(P,!,write(concordo),
	write(discordo)).

	
interrogacao_opcional --> [?].
interrogacao_opcional --> [].
	
frase-->frase_declarativa.
%frase-->frase_interrogatva.
%frase-->frase_conjuntiva.

frase_declarativa -->
	{write('Inicio'),nl},
	sintagma_nominal(N,S,_,_,_,_), !,
	{write('Sujeito'),nl},
	sintagma_verbal(N,A,Ob,Adv,Adjs,Prep,Ob2),
	{write('Predicado'),nl,write(Prep),nl,write(Ob2),nl},
	interrogacao_opcional,
	{write('HERE'),nl,concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2)}.
	
frase_interrogativa -->
	%pron_int(),
	%sintagma_verbal,
	%[?].
	
sintagma_nominal(N,Ob,Adv,Adjs,Prep,Ob2) --> 
	sintagma_nominal_aux(N,Ob,Adv,Adjs,Prep,Ob2).
	
sintagma_nominal_aux(N,Ob,Adv,Adjs,Prep,Ob2) --> 
	sintagma_nominal_aux2(N,Ob,Adv,Adjs,Prep,Ob2),
	sintagma_preposicional(Prep,Ob2).
	
sintagma_nominal_aux(N,Ob,Adv,Adjs,Prep,Ob2) --> 
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

sintagma_preposicional(Prep,Ob) -->
	preposicao(N-_,Prep),
	{write('Prep: '),write(Prep)},
	sintagma_nominal(N,Ob,_,_,_,_),
	{write(Ob),nl}.
	
	
sintagma_adjetival(N-G,Adv,Ajs) -->
	sintagma_adjetival_aux(N-G,Adv,Ajs).
	
sintagma_adjetival(N-G,Adv,Ajs) --> 
	sintagma_adjetival_aux(N-G,Adv,Ajs), [e],

sintagma_adjetival(_,_,_).

sintagma_adjetival_aux(N-G,_,[_|T]) --> 
	adjetivo(N-G,T).
	
sintagma_adjetival_aux(N-G,Adv,[_|T]) --> 
	adverbio(Adv), adjetivo(N-G,T).
	
sintagma_verbal(N,A,Ob,Adv,Adjs,Prep,Ob2) -->
	verbo(N,A,_),
	sintagma_nominal(N,Ob,Adv,Adjs,Prep,Ob2).
	
%sintagma_verbal(_,A,Adv,Adjs,Prep,Ob2) --> 
	%sintagma_nominal.


%frase_conjuntiva -->
	%[e].
	