:-use_module(library(lists)).
:- dynamic adjetivo/1.
:- dynamic contexto/12.

:-include('kb.pl').
:-include('lexicon.pl').
:-include('query.pl').
:-include('utils.pl').
:-include('ui.pl').

contexto(_,_,_,_,_,_,_,_,_,_,_,_).

frase(Resposta)-->frase_declarativa(Resposta).
frase(Resposta)-->frase_interrogativa(Resposta).
frase(Resposta)-->frase_conjuntiva(Resposta).

concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2,Resposta):-
	getCleanAdjs(Adjs,[],CleanAdjs),
	getCleanAdjs(Adjs2,[],CleanAdjs2),
	P =.. [A,S,Ob,Adv,CleanAdjs,Prep,Ob2,CleanAdjs2],
	(P,!,Resposta=concordo;
	Resposta=discordo).

frase_declarativa(Resposta) -->
	sintagma_nominal(N-G,S,_,_,_,_,_), !,
	{length(Adjs,5),length(Adjs2,5)},
	sintagma_verbal(N-G,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2),
	interrogacao_opcional,
	{concorda_frase(A,S,Ob,Adv,Adjs,Prep,Ob2,Adjs2,Resposta)}.
	
%formato(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3,Resposta)
	
resposta(Q,A,Ob,_,_,_,_,_,_,_,_,_,Resposta):-
	resposta_escrever(Q,A,Ob,Resposta).
	
resposta(Q,A,Ob,_,Adjs,Prep,Ob2,Adjs2,_,_,_,_,Resposta) :-
	resposta_nacionalidade(Q, A, Ob, Adjs, Prep, Ob2, Adjs2, Resposta).
	
resposta(Q,A,Ob,_,Adjs,_,_,_,_,_,_,_,Resposta) :-
	resposta_nacionalidade(Q, A, Ob, Adjs, Resposta).
	
resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3,Resposta) :-
	resposta_existencia_livros_data(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3,Resposta).
	
resposta(Q,A,Ob,_,_,_,Ob2,Adjs2,A2,_,_,_,Resposta) :-
	resposta_existencia_livros(Q, A, Ob, Ob2, Adjs2, A2, Resposta).
	
resposta(Q,A,Ob,_,_,_,_,_,A2,_,_,_,Resposta) :-
	resposta_existencia_livros(Q, A, Ob, A2, Resposta).
	
resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,_,_,_,_,Resposta) :-
	resposta_popularidade(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Resposta).
	
resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,_,_,_,_,_,Resposta) :-
	resposta_popularidade(Q, A, Ob, Adv, Adjs, Prep, Ob2, Resposta).
	
resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,_,_,_,_,Resposta) :-
	resposta_tempo(Q, A, Ob, Adv, Adjs, Prep, Ob2, Adjs2, Resposta).
	
resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,_,_,_,_,_,Resposta) :-
	resposta_tempo(Q, A, Ob, Adv, Adjs, Prep, Ob2, Resposta).
	
resposta(Q,A,Ob,_,Adjs,_,_,_,A2,Prep2,Ob3,Adjs3,Resposta) :-
	resposta_nascimento(Q, A, Ob, Adjs, A2, Prep2, Ob3, Adjs3, Resposta).
	
resposta(Q,A,Ob,_,_,_,_,_,A2,Prep2,Ob3,Adjs3,Resposta) :-
	resposta_nascimento(Q, A, Ob, A2, Prep2, Ob3, Adjs3, Resposta).
	
resposta(Q,A,Ob,_,_,_,_,_,A2,Prep2,Ob3,_,Resposta) :-
	resposta_nascimento(Q, A, Ob, A2, Prep2, Ob3, Resposta).
	
frase_interrogativa(Resposta) -->
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
	write('Adjs3: '), write(Adjs3), nl,
	resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3,Resposta),
	retract(contexto(_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(contexto(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3))
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
	
sintagma_nominal_aux3(_,_) --> [].


%%%%%%%%%%%%%%%%%%%%%%%%%%
% sintagma_preposicional %
%%%%%%%%%%%%%%%%%%%%%%%%%%

sintagma_preposicional(Prep,Ob,Adjs) -->
	preposicao(N-G,Prep),
	sintagma_nominal_aux2(N-G,Ob,_,Adjs).
	
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

%%%%%%%%%%%%%%%%%%%%%%%%%
% interrogacao_opcional %
%%%%%%%%%%%%%%%%%%%%%%%%%	

interrogacao_opcional --> [?].
interrogacao_opcional --> [.].
	
%%%%%%%%%%%%%%%%%%%%%%%
% FRASES CONJUNTIVAS  %
%%%%%%%%%%%%%%%%%%%%%%%

frase_conjuntiva(Resposta) -->
	['E'], producao(Resposta),[?].

% Quais os livros de Pessoa? E o mais recente?
producao(Resposta)-->
	[o],
	adverbio(Adv),
	adjetivo(_,Adj),
	{
		contexto(_,A,Ob,_,_,Prep,Ob2,Adjs2,_,_,_,_),
		Q=ql,
		resposta(Q,A,Ob,Adv,[Adj,_,_,_,_],Prep,Ob2,Adjs2,_,_,_,_,Resposta),
		retract(contexto(_,_,_,_,_,_,_,_,_,_,_,_)),
		assert(contexto(Q,A,Ob,Adv,[Adj],Prep,Ob2,Adjs2,_,_,_,_))
	}.

% Quais os livros de Pessoa? E qual o mais recente?
producao(Resposta)-->
	pron_int(_, Q),
	[o],
	adverbio(Adv),
	adjetivo(_,Adj),
	{
		contexto(_,A,Ob,_,_,Prep,Ob2,Adjs2,_,_,_,_),
		resposta(Q,A,Ob,Adv,[Adj,_,_,_,_],Prep,Ob2,Adjs2,_,_,_,_,Resposta),
		retract(contexto(_,_,_,_,_,_,_,_,_,_,_,_)),
		assert(contexto(Q,A,Ob,Adv,[Adj],Prep,Ob2,Adjs2,_,_,_,_))
	}.

% Quem escreveu Os Maias? E A Mensagem?
producao(Resposta)-->
	nome(_,Ob),
	{
		contexto(Q,A,_,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3),
		resposta(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3,Resposta),
		retract(contexto(_,_,_,_,_,_,_,_,_,_,_,_)),
		assert(contexto(Q,A,Ob,Adv,Adjs,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3))
	}.

% Quais sao os escritores portugueses do seculo XX? E franceses?
producao(Resposta)-->
	adjetivo(_,NAdj),
	{
		contexto(Q,A,Ob,Adv,_,Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3),
		resposta(Q,A,Ob,Adv,[NAdj,_,_,_,_],Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3,Resposta),
		retract(contexto(_,_,_,_,_,_,_,_,_,_,_,_)),
		assert(contexto(Q,A,Ob,Adv,[NAdj],Prep,Ob2,Adjs2,A2,Prep2,Ob3,Adjs3))
	}.

