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
	write('*************************Cenas de Literatura Portuguesa*************************'),nl,
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
	write(' Opção:'),nl,
	readOption(Option),
	write(Option),nl,
	integer(Option), Option >= 0, Option < 3, !,
	processOption(Option).
	
mainMenu:-
	clearScreen,
	header,
	write('*   Opcao invalida! Tente novamente.       *'),nl,
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
	write('*   Para voltar ao menu principal escreva "menu"                               *'),nl,
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Pergunta:                                                                    *'),nl,
	readQuestion(Question),
	processQuestion(Question),
	answerMenu.

readQuestion(Question):-
	write(Question),nl.

processQuestion(Question):-
 	write(Question),nl.

answerMenu:-
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Resposta:                                                                    *'),nl,
	write(' Bla bla bla'),nl,
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
	write('* 4 - Quais os escritores portugueses e espanhois do seculo XV?                *'),nl,
	write('* 5 - Quantos livros de escritores africanos existem após o século XVI?        *'),nl,
	write('* 6 - Alberto Caeiro é heterónimo de Fernando Pessoa.                          *'),nl,
	write('* 7 - Pessoa e europeu.                                                        *'),nl,
	write('*                                                                              *'),nl,
	write('* 0 - Voltar ao menu inicial                                                   *'),nl,
	write('*                                                                              *'),nl,
	write('********************************************************************************'),nl,
	write('* Numero da pergunta:                                                          *'),nl,
	readOption(Option),
	write(Option),nl,
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
	ite(Option == 1, frase(['Quem','escreveu','Os Maias','?'],[]), true), !,
	ite(Option == 2, frase(['Quais','sao','os','livros','mais','conhecidos','de','Fernando','Pessoa','?'],[]), true), !,
	ite(Option == 3, frase(['Quem','sao','os','escritores','africanos','?'],[]), true), !,
	ite(Option == 4, frase(['Quais','os','escritores','portugueses','e','espanhois','do','seculo','XV','?'],[]), true), !,
	ite(Option == 5, frase(['Quantos','livros','de','escritores','africanos','existem','apos','o','seculo','XVI','?'],[]), true), !,
	ite(Option == 6, frase(['Alberto','Caeiro','e','heteronimo','de','Fernando','Pessoa','.'],[]), true), !,
	ite(Option == 7, frase(Resposta,['Pessoa','e','europeu'],[]), true), !,
	nl,
	write('* Resposta: '),write(Resposta),nl,
	write('* Pressione Enter para continuar.                                              *'),nl,
	waitForEnter,nl,
	start.