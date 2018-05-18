%base de conhecimento

%************
%* Autores **
%************
%autor(id, primeiro_nome, outros_nomes, data_nasc, data_mort, sexo, id_pais, n_premios, [heretonimos])

autor(1, 'Alexandre', 'Dumas', 1802, 1870, m, 9, 1, []).
autor(2, 'Alexandre', 'Dumas', 1824, 1895, m, 9, 1, []).
autor(3, 'Arthur', 'Clarke', 1917, 2008, m, 15, 1, []).
autor(4, 'Camilo', 'Castelo Branco', 1825, 1890, m, 1, 1, []).
autor(5, 'Charlotte', 'Bronte', 1816, 1855, f, 10, 1, []).
autor(6, 'Eca', 'de Queiroz', 1845, 1900, m, 1, 1, []).
autor(7, 'Eiichirou', 'Oda', 1975, -1, m, 13, 1, []).
autor(8, 'Emily', 'Brontë', 1818, 1848, f, 10, 1, []).
autor(9, 'Yuusei', 'Matsui', 1979, -1, m, 13, 1, []).
autor(10, 'Ernest', 'Hemingway', 1899, 1961, m, 15, 1, []).
autor(11, 'Fernando', 'Pessoa', 1888, 1935, m, 1, 1, ['Alberto Caeiro']).
autor(12, 'Fiodor', 'Dostoiévski', 1821, 1881, m, 15, 1, []).
autor(13, 'Friedrich', 'Nietzsche', 1844, 1900, m, 11, 1, []).
autor(14, 'Gabriel', 'Garcia Marquez', 1927, 2014, m, 7, 1, []).
autor(15, 'Haruki', 'Murakami', 1949, -1, m, 13, 1, []).
autor(16, 'Hiroshi', 'Fujimoto', 1933, 1996, m, 13, 1, []).
autor(17, 'Isabel', 'Allende', 1942, -1, f, 6, 1, []).
autor(18, 'Jane', 'Austen', 1775, 1817, f, 10, 1, []).
autor(19, 'Julio', 'Dinis', 1839, 1871, m, 1, 1, []).
autor(20, 'Kiyohiko', 'Azuma', 1968, -1, m, 13, 1, []).
autor(21, 'Leo', 'Tolstoi', 1828, 1910, m, 15, 1, []).
autor(22, 'Luis', 'de Camões', 1524, 1580, m, 1, 1, []).
autor(23, 'Mark', 'Twain', 1835, 1910, m, 15, 1, []).
autor(24, 'Mia', 'Couto', 1955, -1, m, 14, 1, []).
autor(25, 'Motou', 'Abiko', 1934, -1, m, 13, 1, []).
autor(26, 'Oscar', 'Wilde', 1864, 1900, m, 12, 1, []).
autor(27, 'Vergilio', 'Ferreira', 1916, 1996, m, 1, 1, []).
autor(28, 'William', 'Shakespeare', 1564, 1616, m, 10, 1, []).

%***********
%* Livros **
%**********/
%livro(id, titulo, [autor_ids], ano_pub, [generos_ids], popularidade) %mais tarde meter editora

livro(1, 'A Casa dos Espiritos', [17], 1982, [12], 6).
livro(2, 'A Cidade e as Estrelas', [3], 1956, [5], 8).
livro(3, 'A Dama das Camelias', [2], 1848, [12], 8).
livro(4, 'Adeus As Armas', [10], 1929, [12], 3).
livro(5, 'Agostinho de Ceuta', [4], 1847, [19], 6).
livro(6, 'A Ilustre Casa de Ramires', [6], 1900, [12], 7).
livro(7, 'A Mensagem', [11], 1934, [9], 9).
livro(8, 'Amor de Perdicao', [4], 1862, [12], 1).
livro(9, 'Amor de Salvacao', [4], 1864, [12], 9).
livro(10, 'A Morgadinha dos Canaviais', [19], 1868, [12], 3).
livro(11, 'A Morte de Ivan Ilitch', [21], 1886, [12], 7).
livro(12, 'Anfitrioes', [22], 1587, [19], 8).
livro(13, 'Anna Karenina', [21], 1877, [12], 10).
livro(14, 'Ansatsu Kyoushitsu', [9], 2012, [14], 9).
livro(15, 'Aparicao', [27], 1959, [12], 6).
livro(16, 'A Reliquia', [6], 1887, [12], 7).
livro(17, 'A Tempestade', [28], 1611, [4], 3).
livro(18, 'A Sonata Kreutzer', [21], 1889, [12], 4).
livro(19, 'A Wild Sheep Chase', [15], 1982, [12], 5).
livro(20, 'As Pupilas do Senhor Reitor', [19], 1867, [12], 8).
livro(21, 'Auto de Filodemo', [22], 1587, [19], 5).
livro(22, 'Azumanga Daioh', [20], 1999, [14], 10).
livro(23, 'Cem Anos de Solidao', [14], 1967, [12], 9).
livro(24, 'Crime e Castigo', [12], 1866, [12], 4).
livro(25, 'Cronicando', [24], 1988, [18], 3).
livro(26, 'Doraemon', [16], 1969, [14], 9).
livro(27, 'Emma', [18], 1815, [12], 7).
livro(28, 'Estorias Abensonhadas', [24], 1994, [15], 9).
livro(29, 'Estrela Polar', [27], 1960, [15], 4).
livro(30, 'Estrelas Funestas', [4], 1862, [12], 6).
livro(31, 'Estrelas Propícias', [4], 1863, [12], 7).
livro(32, 'Hamlet', [28], 1601, [13], 8).
livro(33, 'Henrique VIII', [28], 1612, [17], 1).
livro(34, 'Humilhados e Ofendidos', [12], 1861, [12], 8).
livro(35, 'Inspiracoes', [4], 1851, [9], 9).
livro(36, 'Jane Eyre', [5], 1847, [12], 6).
livro(37, 'Lagrimas Abencoadas', [4], 1857, [12], 9).
livro(38, 'Livro Negro de Padre Dinis - I', [4], 1855, [12], 6).
livro(39, 'Livro Negro de Padre Dinis - II', [4], 1855, [12], 4).
livro(40, 'Macbeth', [28], 1607, [13], 6).
livro(41, 'Manha Submersa', [27], 1953, [12], 5).
livro(42, 'Mar Me Quer', [24], 1998, [12], 9).
livro(43, 'Memorias do Subsolo', [12], 1864, [12], 5).
livro(44, 'Misterios de Lisboa - I', [4], 1854, [12], 8).
livro(45, 'Misterios de Lisboa - II', [4], 1854, [12], 1).
livro(46, 'Misterios de Lisboa - III', [4], 1854, [12], 1).
livro(47, 'Mudanca', [27], 1949, [12], 10).
livro(48, 'Ninja Hattori', [25], 1964, [14], 10).
livro(49, 'Nowegian Wood', [15], 1987, [12], 8).
livro(50, 'O Acampamento Indio', [10], 1926, [15], 1).
livro(51, 'O Adolescente', [12], 1875, [12], 8).
livro(52, 'O Amor nos Tempos de Colera', [14], 1985, [12], 7).
livro(53, 'O Conde de Monte Cristo', [1], 1844, [12], 2).
livro(54, 'O Crime do Padro Amaro', [6], 1875, [12], 10).
livro(55, 'O Duplo', [12], 1846, [12], 5).
livro(56, 'O Eterno Marido', [12], 1870, [12], 7).
livro(57, 'O Idiota', [12], 1869, [12], 3).
livro(58, 'O Jogador', [12], 1867, [12], 5).
livro(59, 'Vozes Anoitecidas', [24], 1986, [15], 6).
livro(60, 'O Mandarim', [6], 1880, [10], 8).
livro(61, 'O Mercador de Veneza', [28], 1598, [4], 8).
livro(62, 'O Monte dos Vendavais', [8], 1847, [12], 5).
livro(63, 'O Nascimento da 13', [13], 1872, [16], 1).
livro(64, 'O Outono do Patriarca', [14], 1975, [12], 8).
livro(65, 'O Primo Basilio', [6], 1878, [12], 6).
livro(66, 'Orgulho e Preconceito', [18], 1813, [12], 5).
livro(67, 'Os Fidalgos da Casa Mourisca', [19], 1871, [12], 5).
livro(68, 'Os Irmaos Karamazov', [12], 1880, [12], 2).
livro(69, 'Os Lusiadas', [22], 1572, [9], 5).
livro(70, 'Os Maias', [6], 1888, [12], 4).
livro(71, 'Os Nove Bilioes de Nomes de Deus', [3], 1967, [15], 2).
livro(72, 'Os Pundonores Desagravados', [4], 1845, [9], 9).
livro(73, 'Os Tres Mosqueteiros', [1], 1844, [12], 5).
livro(74, 'One Piece', [7], 1997, [14], 10).
livro(75, 'Otelo', [28], 1603, [13], 5).
livro(76, 'O Visconde de Bragelonne', [1], 1847, [12], 5).
livro(77, 'Pensageiro Frequente', [24], 2010, [12], 9).
livro(78, '9s', [19], 1873, [9], 8).
livro(79, 'Por Quem Os Sinos Tocam', [10], 1940, [12], 4).
livro(80, 'Razao e Sensibilidade', [18], 1811, [12],9).
livro(81, 'Rei Leao', [28], 1605, [13], 7).
livro(82, 'Romeu e Julieta', [28], 1595, [13], 2).
livro(83, 'Sonho de uma Noite de Verão', [28], 1596, [4], 1).
livro(84, 'Terra Sonâmbula', [24], 1992, [12], 2).
livro(85, 'Uma Família Inglesa', [19], 1868, [12], 9).
livro(86, 'Vinte Anos Depois', [1], 1845, [12], 1).

%************
%* Generos **
%************

%genero(id, nome)
genero(1,'terror').
genero(2,'acao').
genero(3,'thriller').
genero(4,'comedia').
genero(5,'sci-fi').
genero(6,'suspanse').
genero(7,'policial').
genero(8,'aventura').
genero(9,'poesia').
genero(10,'novela').
genero(11,'bd').
genero(12,'romance').
genero(13,'tragedia').
genero(14,'manga').
genero(15,'conto').
genero(16,'tratado').
genero(17,'drama').
genero(18,'cronica').
genero(19,'teatro').

%***********
%* Paises **
%**********/
%pais(id, nome, continente, nacionalidade_fem, nacionalidade_masc)

pais(1, 'portugal', europa, 'português', 'portuguesa').
pais(2, 'angola', africa, 'angolano', 'angolana').
pais(3, 'austria', europa, 'austríaco', 'austríaca').
pais(4, 'belgica', europa, 'belga', 'belga').
pais(5, 'brasil', america, 'brasileiro', 'brasileira').
pais(6, 'chile', america, 'chileno', 'chilena').
pais(7, 'colombia', america, 'colombiano', 'colombiana').
pais(8, 'espanha', europa, 'espanhol', 'espanhola').
pais(9, 'frança', europa, 'francês', 'francesa').
pais(10, 'reino unido', europa, 'inglês', 'inglesa').
pais(11, 'alemanha',  europa, 'alemão', 'alemã').
pais(12, 'irlanda',europa, 'irlandês', 'irlandesa').
pais(13, 'japao', asia, 'japonês', 'japonesa').
pais(14, 'mocambique', africa, 'moçambicano', 'moçambicana').
pais(15, 'russia', europa, 'russo', 'russa').
pais(16, 'estados unidos', america, 'americano', 'americana').
pais(17, 'india', asia, 'indiano', 'indiana').

anoAtual(2018).


%---------------------------------------------------------%
% DECLARATIVAS                                            %
%---------------------------------------------------------%

%formato(Suj,Ob,Adv,Adjs,Prep,Ob2,Adj2)

%----------------------%
% Ser                  %
%----------------------%

%Pseudonimo
% ?- frase(['Alberto Caeiro', 'e', 'heteronimo', 'de','Fernando','Pessoa'],[]).

ser(Suj,pseudonimo,_,_,_,Ob2,_):-
	%write(Suj),nl, write(Ob2),nl,
	Suj == Ob2.

%Genero
% ?- frase(['A Mensagem', 'e', 'uma', 'poesia'],[]).

ser(Titulo,Genero,_,_,_,_,_):-
	\+var(Genero),
	genero(GeneroId, Genero),
	livro(_,Titulo,_,_,Generos,_),
	member(GeneroId,Generos).
	
%Nacionalidade
% ?- frase(['Fernando','Pessoa', 'e', 'portugues'],[]).

ser(AutorId,_,_,Adjs,_,_,_):-
	length(Adjs,1),
	nth0(0,Adjs,PaisId),
	autor(AutorId,_,_,_,_,_,PaisId,_,_).
	
% ?- frase(['Fernando','Pessoa', 'e', 'europeu'],[]).

ser(AutorId,_,_,Adjs,_,_,_):-
	length(Adjs,1),
	nth0(0,Adjs,Continente),
	pais(PaisId,_,Continente,_,_),
	autor(AutorId,_,_,_,_,_,PaisId,_,_).

% Popularidade
% ?- frase(['A','Mensagem','e','o','livro','mais','conhecido','de','Pessoa'],[]).

ser(Titulo,_,mais,Adjs,=,AutorId,_):-
	length(Adjs,1),
	nth0(0,Adjs,conhecido),
	getHighestPop(AutorId,MaxPop),
	livro(_,Titulo,_,_,_,Pop),
	Pop == MaxPop.
	
	
% ?- frase(['A','Mensagem','e','o','livro','menos','conhecido','de','Pessoa'],[]).

ser(Titulo,_,menos,Adjs,=,AutorId,_):-
	length(Adjs,1),
	nth0(0,Adjs,conhecido),
	getLowestPop(AutorId,MinPop),
	livro(_,Titulo,_,_,_,Pop),
	Pop == MinPop.

%----------------------%
% Escrever             %
%----------------------%
	
%Livro
% ?- frase(['Fernando', 'Pessoa', 'escreveu', 'A Mensagem'],[]). 

escrever(AutorId,Titulo,_,_,_,_,_):-
	livro(_,Titulo,Autores,_,_,_),
	member(AutorId,Autores).
	
%----------------------%
% Estar                %
%----------------------%

%Esta morto
% ?- frase(['Fernando','Pessoa','esta','morto'],[]).
 
estar(AutorId,_,_,Adjs,_,_,_):-
	length(Adjs,1),
	nth0(0,Adjs,morto),
	anoAtual(Ano),
	autor(AutorId,_,_,_,Morte,_,_,_,_),
	Ano >= Morte.

% ?- frase(['Fernando','Pessoa','esta','vivo'],[]).

estar(AutorId,_,_,Adjs,_,_,_):-
	length(Adjs,1),
	nth0(0,Adjs,vivo),
	autor(AutorId,_,_,_,-1,_,_,_,_).

%----------------------%
% Nascer               %
%----------------------%
% ?- frase(['Fernando','Pessoa','nasceu','em','1888'],[]).

nascer(AutorId,_,_,_,=,Ob2,_):-
	autor(AutorId,_,_,Nascimento,_,_,_,_,_),
	Nascimento == Ob2.
	
% ?- frase(['Fernando','Pessoa','nasceu','no','ano','1888'],[]).

nascer(AutorId,_,_,_,Cmp,ano,Adjs2):-
	(Cmp == = ;  Cmp == < ; Cmp == >),
	length(Adjs2,1),
	nth0(0,Adjs2,Ano),
	autor(AutorId,_,_,Nascimento,_,_,_,_,_),
	call(Cmp,Nascimento,Ano).
	
	
% ?- frase(['Fernando','Pessoa','nasceu','no','seculo','XIX'],[]).

nascer(AutorId,_,_,_,Cmp,seculo,Adjs2):-
	(Cmp == = ;  Cmp == < ; Cmp == >),
	length(Adjs2,1),
	nth0(0,Adjs2,Seculo),
	autor(AutorId,_,_,Nascimento,_,_,_,_,_),
	verificar_seculo(Cmp,Nascimento,Seculo).
	
%----------------------%
% Morrer               %
%----------------------%
%Morreu em
% ?- frase(['Fernando','Pessoa','morreu','em','1935'],[]).

morrer(AutorId,_,_,_,=,Ob2,_):-
	autor(AutorId,_,_,_,Morte,_,_,_,_),
	Morte == Ob2.
	
% ?- frase(['Fernando','Pessoa','morreu','no','ano','1935'],[]).

morrer(AutorId,_,_,_,Cmp,ano,Adjs2):-
	(Cmp == = ;  Cmp == < ; Cmp == >),
	length(Adjs2,1),
	nth0(0,Adjs2,Ano),
	autor(AutorId,_,_,_,Morte,_,_,_,_),
	call(Cmp,Morte,Ano).
	
% ?- frase(['Fernando','Pessoa','morreu','no','seculo','1935'],[]).

morrer(AutorId,_,_,_,Cmp,seculo,Adjs2):-
	(Cmp == = ;  Cmp == < ; Cmp == >),
	length(Adjs2,1),
	nth0(0,Adjs2,Seculo),
	autor(AutorId,_,_,_,Morte,_,_,_,_),
	verificar_seculo(Cmp,Morte,Seculo).
	
%----------------------%
% Existir              %
%----------------------%

existir(LivroId,_,_,_Cmp,seculo,Adjs2,Adjs3) :-
	(Cmp == = ;  Cmp == < ; Cmp == >),
	length(Adjs2,1),
	nth0(0,Adjs2,Seculo),
	length(Adjs3,1),
	nth0(0, Adjs3, Origem),
	livro(LivroId, _, Autores, AnoPub, _, _),
	verificar_seculo(Cmp, AnoPub, Seculo),
	pais(PaisId, _, Origem, _, _),
	autor(AutorId, _, _, _, _, _, PaisId, _, _),
	member(AutorId, Autores).
	
	
%---------------------------------------------------------%
% INTERROGATIVAS                                          %
%---------------------------------------------------------%	
	
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