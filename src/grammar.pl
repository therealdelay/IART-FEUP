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
	sintagma_nominal(N-G,S,_,_,_,_,_), !,
	%{write('Sujeito'),nl},
	{length(Adjs,5),length(Adjs2,5)},
	sintagma_verbal(N-G,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2),
	%{write('Predicado'),nl,write(Prep),nl,write(Ob2),nl},
	interrogacao_opcional,
	%write('HERE'),nl,
	{concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2,Resposta)}.
	
frase_interrogativa(_) -->
	%{write('Start'), nl},
	sintagma_int(N-G, Q), !,
	{length(Adjs,5),length(Adjs2,5),length(Adjs3,5)},
	sintagma_verbal_int(N-G,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3),
	[?],
	{
	write('Q: '), write(Q), nl,
	write('A: '), write(A), nl,
	write('Ob: '), write(Ob), nl,
	write('Adv: '), write(Adv), nl,
	write('Adjs: '), write(Adjs), nl,
	write('Prep: '), write(Prep), nl,
	write('Ob2: '), write(Ob2), nl,
	write('Adjs2: '), write(Adjs2), nl,
	write('A2: '), write(A2), nl,
	write('Prep2: '), write(Prep2), nl,
	write('Ob3: '), write(Ob3), nl,
	write('Adjs3: '), write(Adjs3), nl
	%,resposta(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Ob3, Adjs3, Resposta).
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%
% FRASES INTERROGATIVAS %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% sintagma_int      %
%%%%%%%%%%%%%%%%%%%%%

sintagma_int(N-G,Q) --> pron_int(N-G,Q).

%%%%%%%%%%%%%%%%%%%%%%%%
% sintagma_prep_verbal %
%%%%%%%%%%%%%%%%%%%%%%%%
	
sintagma_prep_verbal(N,A,Prep,Ob3,Adjs) -->
	[que],
	sintagma_prep_verbal_aux(N,A,Prep,Ob3,Adjs).

sintagma_prep_verbal(N,A,Prep,Ob3,Adjs) -->
	sintagma_prep_verbal_aux(N,A,Prep,Ob3,Adjs).
	
sintagma_prep_verbal(_,_,_,_,_) --> [].
	
sintagma_prep_verbal_aux(N,A,Prep,Ob3,Adjs) --> 
	verbo(N,A,_),
	sintagma_preposicional(Prep,Ob3,Adjs).

sintagma_prep_verbal_aux(N,A,_,_,_) --> 
	verbo(N,A,_).
	
	
%%%%%%%%%%%%%%%%%%%%%%%
% sintagma_verbal_int %
%%%%%%%%%%%%%%%%%%%%%%%

sintagma_verbal_int(N-G,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3) -->
	verbo(N,A,_),
	sintagma_nominal(N-G,Ob,Adv,Adjs,Prep,Ob2,Adjs2),
	sintagma_prep_verbal(N,A2,Prep2,Ob3,Adjs3).
	
sintagma_verbal_int(N-G,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3) -->
	{write('Null verb'),nl},
	{A = ser},
	sintagma_nominal(N-G,Ob,Adv,Adjs,Prep,Ob2,Adjs2),
	sintagma_prep_verbal(N,A2,Prep2,Ob3,Adjs3).


%%%%%%%%%%%%%%%%%%%%%%%
% FRASES DECLARATIVAS %
%%%%%%%%%%%%%%%%%%%%%%%
	
	
%%%%%%%%%%%%%%%%%%%%%%
% sintagma_nominal   %
%%%%%%%%%%%%%%%%%%%%%%

sintagma_nominal(N-G,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	sintagma_nominal_aux(N-G,Ob,Adv,Adjs,Prep,Ob2,Adjs2).
	
sintagma_nominal_aux(N-G,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	sintagma_nominal_aux2(N-G,Ob,Adv,Adjs),
	sintagma_preposicional(Prep,Ob2,Adjs2).
	
sintagma_nominal_aux(N-G,Ob,Adv,Adjs,_,_,_) --> 
	sintagma_nominal_aux2(N-G,Ob,Adv,Adjs).

sintagma_nominal_aux2(N-G,Ob,Adv,Adjs) -->
	sintagma_nominal_aux3(N-G,Ob),
	sintagma_adjetival(N-G,Adv,Adjs).
	
sintagma_nominal_aux2(N-G,Ob,_,_) -->
	sintagma_nominal_aux3(N-G,Ob).
		
sintagma_nominal_aux3(N-G,Ob) --> 
	art_indef(N-G), nome(N-G, Ob).
	
sintagma_nominal_aux3(N-G,Ob) -->
	art_def(N-G), nome(N-G,Ob).
	
sintagma_nominal_aux3(N-G,Ob) -->
	nome(N-G,Ob).
	
sintagma_nominal_aux3(N-G,Ob) -->
	[Primeiro],[Ultimo],
	{autor(AutorId,Primeiro,Ultimo,_,_,G,_,_,_),
	N=s, Ob=AutorId}.
	
sintagma_nominal_aux3(N-G,Ob) -->
	%{write('Autor Primeiro'),nl},
	[Primeiro],
	{autor(AutorId,Primeiro,_,_,_,G,_,_,_),
	N=s, Ob=AutorId}.
	
sintagma_nominal_aux3(N-G,Ob) -->
	[Ultimo],
	{autor(AutorId,_,Ultimo,_,_,G,_,_,_),
	N=s, Ob=AutorId}.
	
sintagma_nominal_aux3(_,_) --> [].

sintagma_preposicional(Prep,Ob,Adjs) -->
	preposicao(N-G,Prep),
	{write('Prep: '),write(Prep)},
	sintagma_nominal(N-G,Ob,_,Adjs,_,_,_).
	%{write(Ob),nl}.
	
%%%%%%%%%%%%%%%%%%%%%%
% sintagma_adjetival %
%%%%%%%%%%%%%%%%%%%%%%

sintagma_adjetival(N-G,Adv,Adjs) --> 
	sintagma_adjetival_adv(N-G,Adv,Adjs).
	
sintagma_adjetival(N-G,_,Adjs) -->
	sintagma_adjetival_aux(N-G,Adjs).
	
sintagma_adjetival(_,_,_) --> [].
	
sintagma_adjetival_aux(N-G,Adjs) -->
	sintagma_adjetival_aux2(N-G,Adjs),
	sintagma_adjetival_conj(N-G,Adjs).

sintagma_adjetival_aux2(N-G,Adjs) -->
	adjetivo(N-G,Adj),
	{actual_length(Adjs,0,Length),nth0(Length,Adjs,Adj)}.

sintagma_adjetival_adv(N-G,Adv,Adjs) -->
	adverbio(Adv), adjetivo(N-G,Adj),
	{actual_length(Adjs,0,Length),nth0(Length,Adjs,Adj)},
	sintagma_adjetival_conj(N-G,Adjs).
	
sintagma_adjetival_conj(N-G, Adjs) -->
	[e], sintagma_adjetival_aux2(N-G,Adjs),
	sintagma_adjetival_conj(N-G,Adjs).
	
sintagma_adjetival_conj(_,_) --> [].
	
%%%%%%%%%%%%%%%%%%%%%%
% sintagma_verbal    %
%%%%%%%%%%%%%%%%%%%%%%

sintagma_verbal(N-G,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2) -->
	verbo(N,A,_),
	sintagma_nominal(N-G,Ob,Adv,Adjs,Prep,Ob2,Adjs2).
	
%%%%%%%%%%%%%%%%%%%%%%%
% FRASES CONJUNTIVAS  %
%%%%%%%%%%%%%%%%%%%%%%%

%frase_conjuntiva -->
	%[e].
