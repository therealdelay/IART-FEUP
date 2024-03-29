clearScreen:-
	write('\33\[2J').

readOption(Option):-
	readString(String),
	selectAtIndex(String,1,OptionCode),
	codeToNumber(OptionCode,Option).

selectAtIndex(List, Index, Elem):-
	nth1(Index, List, Elem).

codeToNumber(Code,Value):-
	Value is Code-48 .

ite(If,Then,_):- If, !, Then.
ite(_,_,Else):- Else.

waitForEnter:-
	readString(_).

readString([Char|OtherChars]):-
	get_code(Char),
	ite(Char = 10, (OtherChars = [],true), readString(OtherChars)).

processOption(0):- clearScreen,!.
processOption(Option):-
	ite(Option == 1, questionMenu, true), !,
	ite(Option == 2, examplesMenu, true), !,
	waitForEnter.

start:-
	clearScreen,
	header,
	mainMenu.

header:-
	write('********************************************************************************'),nl,
	write('**************************Informacoes sobre Literatura**************************'),nl,
	write('********************************************************************************'),nl,
	write('*                                                                              *'),nl.

mainMenu:-
	write('*                             FEUP MIEIC IART 2018                             *'),nl,
	write('*                                                                              *'),nl,
	write('*               By Bruno Piedade, Danny Soares and Sergio Salgado              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*   Menu Principal                                                             *'),nl,
	write('*                                                                              *'),nl,
	write('* 1 - Fazer uma pergunta                                                       *'),nl,
	write('* 2 - Perguntas exemplo                                                        *'),nl,
	write('*                                                                              *'),nl,
	write('* 0 - Sair                                                                     *'),nl,
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write(' Opcao:'),nl,
	readOption(Option),
	write(Option),nl,
	integer(Option), Option >= 0, Option < 3, !,
	processOption(Option).
	
mainMenu:-
	clearScreen,
	header,
	write('* Opcao invalida, tente novamente                                              *'),nl,
	mainMenu.

questionMenu:-
	clearScreen,
	header,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*   Escreva uma pergunta sobre literatura portuguesa                           *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*                                                                              *'),nl,
	write('*   Para voltar ao menu principal escreva "menu"                               *'),nl,
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Pergunta:                                                                    *'),nl,
	readQuestion(Question),
	ite(atom_string(menu,Question),(clearScreen,start),true),
	processQuestion(Question,FinalQuestion),
	answerMenu(FinalQuestion).

readQuestion(Question):-
	read_string(user_input,"\n", "\r", _, Question).

quoteTokens([],SplitQuestionAux,SplitQuestionAux).
quoteTokens([H|T],List,SplitQuestionAux):-
	atomic_concat('',H,Aux),atomic_concat(Aux,'',Res),
	append(List,[Res],AppList),
	quoteTokens(T,AppList,SplitQuestionAux).

processQuestion(Question,FinalQuestion):-
	sub_atom(Question,_,1,0,Point),
	(Point = '.'; Point = '?'),
	split_string(Question," ",Point,SplitQuestion),
	quoteTokens(SplitQuestion,[],SplitQuestionAux),
	atomic_concat('',Point,Aux),atomic_concat(Aux,'',Res),
	append(SplitQuestionAux,[Res],FinalQuestion).

processQuestion(_,FinalQuestion):-
	FinalQuestion = 'Erro semantico/sintatico.'.

answerMenu(Question):-
	ite(Question = 'Erro semantico/sintatico.',Resposta=Question,frase(Resposta,Question,[])),
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Resposta:                                                                    *'),nl,
	write('|: '),
	write(Resposta),nl,
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Pressione Enter para voltar ao menu                                          *'),nl,
	waitForEnter,
	start.


examplesMenu:-
	clearScreen,
	header,
	write('*                                                                              *'),nl,
	write('*   Escolha uma pergunta exemplo sobre literatura portuguesa                   *'),nl,
	write('*                                                                              *'),nl,
	write('* 1 - Quem escreveu Os Maias?                                                  *'),nl,
	write('* 2 - Quais sao os livros mais conhecidos de Fernando Pessoa?                  *'),nl,
	write('* 3 - Quem sao os escritores africanos?                                        *'),nl,
	write('* 4 - Quais os escritores portugueses e japoneses do seculo XX?                *'),nl,
	write('* 5 - Quantos livros de escritores africanos existem apos o seculo XVI?        *'),nl,
	write('* 6 - Alberto Caeiro e heteronimo de Fernando Pessoa.                          *'),nl,
	write('* 7 - Pessoa e europeu.                                                        *'),nl,
	write('*                                                                              *'),nl,
	write('* 0 - Voltar ao menu inicial                                                   *'),nl,
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Numero da pergunta:                                                          *'),nl,
	readOption(Option),
	%write(Option),nl,
	Option >= 0, Option =< 7,
	processQuestionOption(Option),
	write("Good option.").

examplesMenu:-
	clearScreen,
	header,
	write('*   Opcao invalida! Tente novamente.       *'),nl,
	examplesMenu.

processQuestionOption(0):- start.
processQuestionOption(Option):-
	ite(Option == 1, frase(Resposta,['Quem','escreveu','Os','Maias','?'],[]), true), !,
	ite(Option == 2, frase(Resposta,['Quais','sao','os','livros','mais','conhecidos','de','Fernando','Pessoa','?'],[]), true), !,
	ite(Option == 3, frase(Resposta,['Quem','sao','os','escritores','africanos','?'],[]), true), !,
	ite(Option == 4, frase(Resposta,['Quais','os','escritores','portugueses','e','japoneses','do','seculo','XX','?'],[]), true), !,
	ite(Option == 5, frase(Resposta,['Quantos','livros','de','escritores','africanos','existem','apos','o','seculo','XVI','?'],[]), true), !,
	ite(Option == 6, frase(Resposta,['Alberto','Caeiro','e','heteronimo','de','Fernando','Pessoa','.'],[]), true), !,
	ite(Option == 7, frase(Resposta,['Pessoa','e','europeu','.'],[]), true), !,
	write('********************************************************************************'),nl,
	write('* Resposta: '),write(Resposta),nl,
	write('* Pressione Enter para continuar.                                              *'),nl,
	waitForEnter,nl,
	start.